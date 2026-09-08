import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'content-type, x-user-token',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
};

const JWT_SECRET  = Deno.env.get('GUIDE_JWT_SECRET')!;
const SB_URL      = Deno.env.get('SUPABASE_URL')!;
const SERVICE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;

async function verifyJwt(token: string): Promise<string | null> {
  try {
    const parts = token.split('.');
    if (parts.length !== 3) return null;

    const pad = (s: string) => s + '='.repeat((4 - s.length % 4) % 4);
    const decode = (s: string) => JSON.parse(atob(pad(s.replace(/-/g,'+').replace(/_/g,'/'))));

    const payload = decode(parts[1]);
    if (payload.role !== 'guide') return null;
    if (payload.exp && payload.exp < Math.floor(Date.now() / 1000)) return null;

    const key = await crypto.subtle.importKey(
      'raw', new TextEncoder().encode(JWT_SECRET),
      { name: 'HMAC', hash: 'SHA-256' }, false, ['verify']
    );
    const sigBytes = Uint8Array.from(atob(pad(parts[2].replace(/-/g,'+').replace(/_/g,'/'))), c => c.charCodeAt(0));
    const valid = await crypto.subtle.verify('HMAC', key, sigBytes, new TextEncoder().encode(`${parts[0]}.${parts[1]}`));
    if (!valid) return null;

    return payload.email ?? null;
  } catch {
    return null;
  }
}

serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response(null, { headers: CORS });

  const token = req.headers.get('x-user-token') ?? '';
  const email = await verifyJwt(token);
  if (!email) {
    return new Response(JSON.stringify({ error: 'Unauthorized' }), { status: 401, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  const sbHeaders = {
    'apikey': SERVICE_KEY,
    'Authorization': `Bearer ${SERVICE_KEY}`,
    'Content-Type': 'application/json',
  };

  // GET — charger le draft
  if (req.method === 'GET') {
    const res = await fetch(
      `${SB_URL}/rest/v1/user_drafts?email=eq.${encodeURIComponent(email)}&select=drafted_ids&limit=1`,
      { headers: sbHeaders }
    );
    const rows = await res.json();
    const drafted_ids = rows[0]?.drafted_ids ?? [];
    return new Response(JSON.stringify({ drafted_ids }), { status: 200, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  // POST — sauvegarder le draft (upsert)
  if (req.method === 'POST') {
    const body = await req.json();
    const drafted_ids = body.drafted_ids ?? [];
    const res = await fetch(
      `${SB_URL}/rest/v1/user_drafts?on_conflict=email`,
      {
        method: 'POST',
        headers: { ...sbHeaders, 'Prefer': 'resolution=merge-duplicates,return=minimal' },
        body: JSON.stringify({ email, drafted_ids, updated_at: new Date().toISOString() }),
      }
    );
    const status = (res.ok || res.status === 204 || res.status === 201) ? 200 : res.status;
    return new Response(null, { status, headers: CORS });
  }

  return new Response('Method not allowed', { status: 405, headers: CORS });
});
