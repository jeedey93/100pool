import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_SERVICE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY')!;

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'content-type, apikey, authorization',
};

serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS });
  if (req.method !== 'POST') return new Response('Method not allowed', { status: 405, headers: CORS });

  let email: string;
  try {
    const body = await req.json();
    email = (body.email || '').trim().toLowerCase();
  } catch {
    return new Response('Invalid JSON', { status: 400, headers: CORS });
  }

  if (!email) return new Response('Missing email', { status: 400, headers: CORS });

  // Look up access row
  const dbRes = await fetch(
    `${SUPABASE_URL}/rest/v1/poolers_access?email=eq.${encodeURIComponent(email)}&product=eq.guide_2026_27&select=token,expires_at&limit=1`,
    {
      headers: {
        'apikey': SUPABASE_SERVICE_KEY,
        'Authorization': `Bearer ${SUPABASE_SERVICE_KEY}`,
      },
    }
  );

  const rows = await dbRes.json();

  // Always return 200 to avoid email enumeration
  if (!rows.length || new Date(rows[0].expires_at) < new Date()) {
    return new Response('OK', { status: 200, headers: CORS });
  }

  const token = rows[0].token;
  const magicLink = `https://100pool.ca/guide-poolers/2026-2027/?token=${token}`;

  await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: 'Guide 100% Pool <guide@100pool.ca>',
      to: email,
      subject: 'Ton lien d\'accès au Guide des poolers 2026-27 🏒',
      html: `
        <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;max-width:520px;margin:0 auto;padding:32px 24px;background:#f8fafc;">
          <div style="background:white;border-radius:16px;padding:36px;box-shadow:0 2px 12px rgba(0,0,0,0.06);">
            <img src="https://100pool.ca/100pool.jpg" alt="100% Pool" style="width:64px;height:64px;border-radius:14px;margin-bottom:20px;">
            <h1 style="font-size:1.4em;font-weight:800;color:#1e293b;margin:0 0 8px;">Voici ton lien d'accès</h1>
            <p style="color:#475569;font-size:0.95em;line-height:1.6;margin:0 0 24px;">
              Tu as demandé à récupérer ton accès au <strong>Guide des poolers 100% Pool 2026-27</strong>.
              Clique sur le bouton ci-dessous pour accéder au guide.
            </p>
            <a href="${magicLink}" style="display:inline-block;background:#2d8a3e;color:white;font-weight:700;font-size:1em;padding:14px 28px;border-radius:10px;text-decoration:none;">
              Accéder au Guide →
            </a>
            <p style="color:#94a3b8;font-size:0.78em;margin-top:24px;line-height:1.5;">
              Ce lien est personnel — gardez-le en sécurité.<br>
              Si vous n'avez pas fait cette demande, ignorez ce courriel.
            </p>
          </div>
        </div>
      `,
    }),
  });

  return new Response('OK', { status: 200, headers: CORS });
});
