-- Run this in the Supabase SQL Editor (https://supabase.com/dashboard/project/_/sql)

-- 1. Create poolers_access table
CREATE TABLE IF NOT EXISTS poolers_access (
  id         uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email      text NOT NULL,
  token      uuid NOT NULL DEFAULT gen_random_uuid(),
  product    text NOT NULL DEFAULT 'guide_2026_27',
  created_at timestamptz DEFAULT now(),
  expires_at timestamptz DEFAULT (now() + interval '1 year')
);

-- 2. Enable Row Level Security (anon key cannot read/write this table)
ALTER TABLE poolers_access ENABLE ROW LEVEL SECURITY;

-- No policies for anon — only service role (used by Edge Function) can access

-- 3. Create public RPC function to validate a token
--    Returns true/false only — exposes no email or PII
CREATE OR REPLACE FUNCTION validate_access_token(p_token uuid)
RETURNS boolean
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM poolers_access
    WHERE token = p_token
      AND expires_at > now()
  );
$$;

GRANT EXECUTE ON FUNCTION validate_access_token TO anon;

-- ── LIGUE ──────────────────────────────────────────────────

-- 4. Ligues de pool
CREATE TABLE IF NOT EXISTS pool_leagues (
  id         uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name       text NOT NULL,
  slug       text UNIQUE NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- 5. Équipes dans une ligue
CREATE TABLE IF NOT EXISTS pool_teams (
  id         uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  league_id  uuid NOT NULL REFERENCES pool_leagues(id) ON DELETE CASCADE,
  name       text NOT NULL,
  picks      jsonb NOT NULL DEFAULT '[]',
  created_at timestamptz DEFAULT now()
);

-- Anon peut lire et écrire (outil de commissaire privé, pas de login)
ALTER TABLE pool_leagues ENABLE ROW LEVEL SECURITY;
ALTER TABLE pool_teams   ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_all_leagues" ON pool_leagues FOR ALL TO anon USING (true) WITH CHECK (true);
CREATE POLICY "anon_all_teams"   ON pool_teams   FOR ALL TO anon USING (true) WITH CHECK (true);
