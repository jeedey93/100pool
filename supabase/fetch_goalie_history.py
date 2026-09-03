"""
Fetch NHL IDs and season history for goalies in Supabase.

Usage:
    python supabase/fetch_goalie_history.py

What this does:
  - Fetches all goalies without nhl_id from poolers_players
  - Searches NHL API to find their player ID
  - Fetches last 5 seasons of goalie stats (GP, W, L, OT, GAA, SV%, SO)
  - Updates nhl_id and season_history in Supabase
"""

import requests
import sys
import json
import time

SUPABASE_URL = "https://fifurqlitkywtmhgtzeu.supabase.co"
SUPABASE_KEY = (
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"
    ".eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpZnVycWxpdGt5d3RtaGd0emV1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY3MDIyMjQsImV4cCI6MjA5MjI3ODIyNH0"
    ".KPVPj1qwbSJJMyLR_-AhDcRs0vi2sUU6qbFQ-kH53C0"
)
HEADERS = {
    "apikey": SUPABASE_KEY,
    "Authorization": f"Bearer {SUPABASE_KEY}",
    "Content-Type": "application/json",
}
NHL_HEADERS = {"User-Agent": "Mozilla/5.0"}

SEASON_MAP = {
    20252026: "2025-26",
    20242025: "2024-25",
    20232024: "2023-24",
    20222023: "2022-23",
    20212022: "2021-22",
    20202021: "2020-21",
}


def verify_goalie(nhl_id):
    """Verify that nhl_id is a goalie via landing page."""
    try:
        r = requests.get(f"https://api-web.nhle.com/v1/player/{nhl_id}/landing", headers=NHL_HEADERS, timeout=10)
        if r.status_code != 200:
            return False
        data = r.json()
        return data.get("position") == "G"
    except:
        return False


def search_nhl_player(name):
    """Search NHL API for a goalie by name, return (nhl_id, full_name) or None."""
    try:
        url = f"https://search.d3.nhle.com/api/v1/search/player?culture=en-us&limit=10&q={requests.utils.quote(name)}"
        r = requests.get(url, headers=NHL_HEADERS, timeout=10)
        if r.status_code != 200:
            return None
        results = r.json()
        if not results:
            return None
        name_lower = name.lower()
        # First pass: exact name + position G
        for p in results:
            full = p.get("name", "").strip().lower()
            pid = int(p.get("playerId", 0))
            if full == name_lower and p.get("positionCode") == "G":
                return pid, full
        # Second pass: exact name, verify via landing page
        for p in results:
            full = p.get("name", "").strip().lower()
            pid = int(p.get("playerId", 0))
            if full == name_lower and verify_goalie(pid):
                return pid, full
        # Third pass: last name match + G
        last = name.lower().split()[-1]
        for p in results:
            full = p.get("name", "").strip().lower()
            pid = int(p.get("playerId", 0))
            if full.split()[-1] == last:
                if p.get("positionCode") == "G" or verify_goalie(pid):
                    return pid, full
        return None
    except Exception as e:
        print(f"  Search error for {name}: {e}")
        return None


def fetch_goalie_seasons(nhl_id):
    """Fetch last 5 seasons of goalie stats from NHL API."""
    try:
        url = f"https://api-web.nhle.com/v1/player/{nhl_id}/landing"
        r = requests.get(url, headers=NHL_HEADERS, timeout=10)
        if r.status_code != 200:
            return []
        data = r.json()
        # seasonTotals contains per-season stats
        totals = data.get("seasonTotals", [])
        # Filter regular season NHL only
        nhl_seasons = [
            s for s in totals
            if s.get("leagueAbbrev") == "NHL" and s.get("gameTypeId") == 2
        ]
        # Sort by season descending, take last 5
        nhl_seasons.sort(key=lambda s: s.get("season", 0), reverse=True)
        seasons = []
        for s in nhl_seasons[:5]:
            season_code = s.get("season", 0)
            label = SEASON_MAP.get(season_code)
            if not label:
                # Format unknown season code e.g. 20192020 → "2019-20"
                sc = str(season_code)
                label = f"{sc[:4]}-{sc[6:]}" if len(sc) == 8 else str(season_code)
            seasons.append({
                "season": label,
                "team":   s.get("teamAbbrev", {}).get("default", "—") if isinstance(s.get("teamAbbrev"), dict) else s.get("teamAbbrev", "—"),
                "gp":     s.get("gamesPlayed"),
                "w":      s.get("wins"),
                "l":      s.get("losses"),
                "otl":    s.get("otLosses"),
                "gaa":    round(s["goalsAgainstAvg"], 2) if s.get("goalsAgainstAvg") else None,
                "svp":    round(s["savePctg"], 3) if s.get("savePctg") else None,
                "so":     s.get("shutouts"),
            })
        # Return oldest first (for display)
        return list(reversed(seasons))
    except Exception as e:
        print(f"  History error for nhl_id {nhl_id}: {e}")
        return []


def main():
    # Fetch all goalies without nhl_id
    res = requests.get(
        f"{SUPABASE_URL}/rest/v1/poolers_players?select=id,name,pos&pos=eq.G&nhl_id=is.null&order=rank.asc",
        headers=HEADERS,
    )
    goalies = res.json()
    print(f"Found {len(goalies)} goalies without nhl_id")

    updated = 0
    not_found = []

    for g in goalies:
        name = g["name"]
        pid  = g["id"]
        print(f"  [{updated+1}/{len(goalies)}] {name}...", end=" ", flush=True)

        result = search_nhl_player(name)
        if not result:
            print("NOT FOUND")
            not_found.append(name)
            time.sleep(0.3)
            continue

        nhl_id, matched_name = result
        seasons = fetch_goalie_seasons(nhl_id)
        print(f"→ {nhl_id} ({matched_name}), {len(seasons)} seasons")

        patch = {
            "nhl_id": nhl_id,
            "season_history": json.dumps(seasons) if seasons else None,
        }
        r = requests.patch(
            f"{SUPABASE_URL}/rest/v1/poolers_players?id=eq.{pid}",
            headers={**HEADERS, "Prefer": "return=minimal"},
            json=patch,
        )
        if r.status_code not in (200, 204):
            print(f"    PATCH failed: {r.status_code} {r.text[:100]}")
        else:
            updated += 1

        time.sleep(0.4)

    print(f"\nDone! {updated}/{len(goalies)} updated.")
    if not_found:
        print(f"Not found ({len(not_found)}): {', '.join(not_found)}")


if __name__ == "__main__":
    main()
