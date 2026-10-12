-- Run this in the Supabase SQL Editor to create the nhl_stats_live table
-- https://supabase.com/dashboard/project/fifurqlitkywtmhgtzeu/sql

CREATE TABLE IF NOT EXISTS nhl_stats_live (
  nhl_id    text PRIMARY KEY,
  gp        int  DEFAULT 0,
  g         int  DEFAULT 0,
  a         int  DEFAULT 0,
  pts       int  DEFAULT 0,
  -- Goalies only
  gaa       numeric(4,2) DEFAULT NULL,
  svp       numeric(5,3) DEFAULT NULL,
  updated_at timestamptz DEFAULT now()
);

-- Anon can read (page fetches without auth header check on this table)
ALTER TABLE nhl_stats_live ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_read_nhl_stats_live"
  ON nhl_stats_live FOR SELECT TO anon USING (true);

-- Service role (used by sync script) can upsert — no policy needed, service role bypasses RLS
