"""
Sync current NHL season stats into Supabase nhl_stats_live table.

Usage:
    SUPABASE_SERVICE_KEY=<your-service-role-key> python supabase/sync_nhl_stats.py

Gets it from env var SUPABASE_SERVICE_KEY (service role key — found in
Supabase dashboard → Project Settings → API → service_role key).

What this does:
  - Fetches all players with nhl_id from poolers_players
  - Calls NHL API /v1/player/{id}/landing for each player
  - Reads 2026-27 regular season stats (gp, g, a, pts for skaters; gp, w, gaa, svp for goalies)
  - Upserts all rows into nhl_stats_live in one batch
"""

import os
import sys
import json
import time
import requests

SUPABASE_URL = "https://fifurqlitkywtmhgtzeu.supabase.co"
ANON_KEY = (
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9"
    ".eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpZnVycWxpdGt5d3RtaGd0emV1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY3MDIyMjQsImV4cCI6MjA5MjI3ODIyNH0"
    ".KPVPj1qwbSJJMyLR_-AhDcRs0vi2sUU6qbFQ-kH53C0"
)
SERVICE_KEY = os.environ.get("SUPABASE_SERVICE_KEY", "")
if not SERVICE_KEY:
    print("ERROR: Set SUPABASE_SERVICE_KEY env var (service role key from Supabase dashboard)")
    sys.exit(1)

SB_HEADERS = {
    "apikey": SERVICE_KEY,
    "Authorization": f"Bearer {SERVICE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "resolution=merge-duplicates",
}
NHL_HEADERS = {"User-Agent": "Mozilla/5.0"}

SEASON = 20262027
GAME_TYPE = 2  # regular season


def fetch_players():
    """Fetch all players with an nhl_id from Supabase."""
    url = f"{SUPABASE_URL}/rest/v1/poolers_players?select=nhl_id,name,pos&nhl_id=not.is.null"
    r = requests.get(url, headers={"apikey": ANON_KEY, "Authorization": f"Bearer {ANON_KEY}"}, timeout=15)
    r.raise_for_status()
    return r.json()


def fetch_nhl_stats(nhl_id, pos):
    """Fetch current season stats from NHL API for one player."""
    try:
        r = requests.get(
            f"https://api-web.nhle.com/v1/player/{nhl_id}/landing",
            headers=NHL_HEADERS,
            timeout=10,
        )
        if r.status_code != 200:
            return None
        data = r.json()
        for s in data.get("seasonTotals", []):
            if s.get("season") == SEASON and s.get("gameTypeId") == GAME_TYPE:
                if pos == "G":
                    return {
                        "nhl_id": str(nhl_id),
                        "gp": s.get("gamesPlayed", 0),
                        "g": s.get("wins", 0),
                        "a": 0,
                        "pts": s.get("wins", 0),
                        "gaa": round(s.get("goalsAgainstAvg", 0), 2) or None,
                        "svp": round(s.get("savePctg", 0), 3) or None,
                    }
                else:
                    return {
                        "nhl_id": str(nhl_id),
                        "gp": s.get("gamesPlayed", 0),
                        "g": s.get("goals", 0),
                        "a": s.get("assists", 0),
                        "pts": s.get("points", 0),
                        "gaa": None,
                        "svp": None,
                    }
        # Player hasn't played yet this season — return zeros
        return {
            "nhl_id": str(nhl_id),
            "gp": 0, "g": 0, "a": 0, "pts": 0,
            "gaa": None, "svp": None,
        }
    except Exception as e:
        print(f"  Warning: NHL API error for {nhl_id}: {e}")
        return None


def upsert_batch(rows):
    """Upsert a list of stat rows into nhl_stats_live."""
    url = f"{SUPABASE_URL}/rest/v1/nhl_stats_live"
    r = requests.post(url, headers=SB_HEADERS, json=rows, timeout=30)
    if not r.ok:
        print(f"  Upsert error {r.status_code}: {r.text[:200]}")
        r.raise_for_status()


def main():
    print(f"Fetching players from Supabase...")
    players = fetch_players()
    print(f"  {len(players)} players with nhl_id")

    rows = []
    errors = 0
    for i, p in enumerate(players):
        nhl_id = p["nhl_id"]
        pos = p.get("pos", "")
        name = p.get("name", nhl_id)

        stats = fetch_nhl_stats(nhl_id, pos)
        if stats is None:
            errors += 1
            continue
        rows.append(stats)

        if (i + 1) % 50 == 0:
            print(f"  Fetched {i+1}/{len(players)}...")

        # Be polite to the NHL API
        time.sleep(0.05)

    print(f"\nFetched stats for {len(rows)} players ({errors} errors)")

    # Deduplicate by nhl_id (keep last occurrence)
    seen = {}
    for r in rows:
        seen[r["nhl_id"]] = r
    rows = list(seen.values())
    print(f"  {len(rows)} unique nhl_ids after dedup")

    # Upsert in batches of 200
    BATCH = 200
    for i in range(0, len(rows), BATCH):
        batch = rows[i:i+BATCH]
        upsert_batch(batch)
        print(f"  Upserted rows {i+1}–{i+len(batch)}")

    print(f"\nDone. {len(rows)} rows synced to nhl_stats_live.")


if __name__ == "__main__":
    main()
