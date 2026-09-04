import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
};

const ADMIN_PASSWORD = Deno.env.get('ADMIN_PASSWORD')!;
const JWT_SECRET     = Deno.env.get('ADMIN_JWT_SECRET')!;

// Sign a minimal JWT (HS256) valid for 8 hours
async function signJwt(secret: string): Promise<string> {
  const header  = btoa(JSON.stringify({ alg: 'HS256', typ: 'JWT' })).replace(/=/g,'').replace(/\+/g,'-').replace(/\//g,'_');
  const exp     = Math.floor(Date.now() / 1000) + 8 * 3600;
  const payload = btoa(JSON.stringify({ role: 'admin', exp })).replace(/=/g,'').replace(/\+/g,'-').replace(/\//g,'_');

  const key = await crypto.subtle.importKey(
    'raw', new TextEncoder().encode(secret),
    { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']
  );
  const sig = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(`${header}.${payload}`));
  const sigB64 = btoa(String.fromCharCode(...new Uint8Array(sig))).replace(/=/g,'').replace(/\+/g,'-').replace(/\//g,'_');
  return `${header}.${payload}.${sigB64}`;
}

serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response(null, { headers: CORS });
  if (req.method !== 'POST') return new Response('Method not allowed', { status: 405, headers: CORS });

  let password: string;
  try {
    const body = await req.json();
    password = body.password;
  } catch {
    return new Response(JSON.stringify({ error: 'Invalid JSON' }), { status: 400, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  if (!ADMIN_PASSWORD || !JWT_SECRET) {
    return new Response(JSON.stringify({ error: 'Server misconfigured' }), { status: 500, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  if (password !== ADMIN_PASSWORD) {
    // Small delay to slow brute-force
    await new Promise(r => setTimeout(r, 800));
    return new Response(JSON.stringify({ error: 'Invalid password' }), { status: 401, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  const token = await signJwt(JWT_SECRET);
  return new Response(JSON.stringify({ token }), { status: 200, headers: { ...CORS, 'Content-Type': 'application/json' } });
});
