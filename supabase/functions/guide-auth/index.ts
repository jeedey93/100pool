import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
};

const JWT_SECRET   = Deno.env.get('GUIDE_JWT_SECRET')!;
const SB_URL       = Deno.env.get('SUPABASE_URL')!;
const SERVICE_KEY  = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;

// Sign HS256 JWT valid for 365 days, includes email claim
async function signJwt(email: string, secret: string): Promise<string> {
  const header  = btoa(JSON.stringify({ alg: 'HS256', typ: 'JWT' }))
    .replace(/=/g,'').replace(/\+/g,'-').replace(/\//g,'_');
  const exp     = Math.floor(Date.now() / 1000) + 365 * 24 * 3600;
  const payload = btoa(JSON.stringify({ role: 'guide', email, exp }))
    .replace(/=/g,'').replace(/\+/g,'-').replace(/\//g,'_');

  const key = await crypto.subtle.importKey(
    'raw', new TextEncoder().encode(secret),
    { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']
  );
  const sig = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(`${header}.${payload}`));
  const sigB64 = btoa(String.fromCharCode(...new Uint8Array(sig)))
    .replace(/=/g,'').replace(/\+/g,'-').replace(/\//g,'_');
  return `${header}.${payload}.${sigB64}`;
}

serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response(null, { headers: CORS });
  if (req.method !== 'POST') return new Response('Method not allowed', { status: 405, headers: CORS });

  let email: string;
  try {
    const body = await req.json();
    email = (body.email ?? '').trim().toLowerCase();
  } catch {
    return new Response(JSON.stringify({ error: 'Invalid JSON' }), { status: 400, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  if (!email || !email.includes('@')) {
    return new Response(JSON.stringify({ error: 'Invalid email' }), { status: 400, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  if (!JWT_SECRET || !SB_URL || !SERVICE_KEY) {
    return new Response(JSON.stringify({ error: 'Server misconfigured' }), { status: 500, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  // Check poolers_access table for this email
  const res = await fetch(
    `${SB_URL}/rest/v1/poolers_access?email=eq.${encodeURIComponent(email)}&select=email,expires_at&limit=1`,
    { headers: { 'apikey': SERVICE_KEY, 'Authorization': `Bearer ${SERVICE_KEY}` } }
  );

  if (!res.ok) {
    return new Response(JSON.stringify({ error: 'DB error' }), { status: 500, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  const rows = await res.json();

  // Always delay to prevent email enumeration
  await new Promise(r => setTimeout(r, 600));

  if (!rows.length) {
    return new Response(JSON.stringify({ error: 'not_found' }), { status: 401, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  // Check expiry if set
  const row = rows[0];
  if (row.expires_at && new Date(row.expires_at) < new Date()) {
    return new Response(JSON.stringify({ error: 'expired' }), { status: 401, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  const token = await signJwt(email, JWT_SECRET);
  return new Response(JSON.stringify({ token }), { status: 200, headers: { ...CORS, 'Content-Type': 'application/json' } });
});
