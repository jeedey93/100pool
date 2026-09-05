import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'content-type, x-admin-token',
  'Access-Control-Allow-Methods': 'GET, POST, PATCH, DELETE, OPTIONS',
};

const JWT_SECRET     = Deno.env.get('ADMIN_JWT_SECRET')!;
const SUPABASE_URL   = Deno.env.get('SUPABASE_URL')!;
const SERVICE_KEY    = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;

// Verify HS256 JWT and check expiry
async function verifyJwt(token: string, secret: string): Promise<boolean> {
  try {
    const parts = token.split('.');
    if (parts.length !== 3) return false;

    const key = await crypto.subtle.importKey(
      'raw', new TextEncoder().encode(secret),
      { name: 'HMAC', hash: 'SHA-256' }, false, ['verify']
    );

    const pad = (s: string) => s + '='.repeat((4 - s.length % 4) % 4);
    const sigBytes = Uint8Array.from(atob(pad(parts[2].replace(/-/g,'+').replace(/_/g,'/'))), c => c.charCodeAt(0));
    const valid = await crypto.subtle.verify('HMAC', key, sigBytes, new TextEncoder().encode(`${parts[0]}.${parts[1]}`));
    if (!valid) return false;

    const payload = JSON.parse(atob(pad(parts[1].replace(/-/g,'+').replace(/_/g,'/'))));
    if (payload.exp && payload.exp < Math.floor(Date.now() / 1000)) return false;
    if (payload.role !== 'admin') return false;

    return true;
  } catch {
    return false;
  }
}

serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response(null, { headers: CORS });

  // Verify admin token
  const token = req.headers.get('x-admin-token') ?? '';
  if (!await verifyJwt(token, JWT_SECRET)) {
    return new Response(JSON.stringify({ error: 'Unauthorized' }), { status: 401, headers: { ...CORS, 'Content-Type': 'application/json' } });
  }

  // Proxy the request to Supabase REST API using service_role key
  const url = new URL(req.url);
  // Strip everything up to and including "admin-data", keep the rest as the target path
  // Handles both /functions/v1/admin-data/... and /admin-data/...
  const targetPath = url.pathname.replace(/^.*\/admin-data/, '');
  const targetUrl  = `${SUPABASE_URL}${targetPath}${url.search}`;

  const upstreamHeaders: Record<string, string> = {
    'apikey':        SERVICE_KEY,
    'Authorization': `Bearer ${SERVICE_KEY}`,
    'Content-Type':  'application/json',
  };

  // Forward Prefer header if present (for upsert/return=minimal)
  const prefer = req.headers.get('prefer');
  if (prefer) upstreamHeaders['Prefer'] = prefer;

  const body = ['GET', 'HEAD'].includes(req.method) ? undefined : await req.text();

  const upstream = await fetch(targetUrl, {
    method:  req.method,
    headers: upstreamHeaders,
    body,
  });

  const resBody = await upstream.text();
  return new Response(resBody, {
    status:  upstream.status,
    headers: { ...CORS, 'Content-Type': upstream.headers.get('Content-Type') ?? 'application/json' },
  });
});
