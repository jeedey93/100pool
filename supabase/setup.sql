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
