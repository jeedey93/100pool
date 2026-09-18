import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_SERVICE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY')!;
const NOTIFY_EMAIL = '100pool.podcast@gmail.com';

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'content-type, apikey, authorization',
};

serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS });
  if (req.method !== 'POST') return new Response('Method not allowed', { status: 405, headers: CORS });

  let message: string, email: string | null, rating: number | null;
  try {
    const body = await req.json();
    message = (body.message || '').trim();
    email = (body.email || '').trim().toLowerCase() || null;
    rating = body.rating != null ? Math.min(5, Math.max(1, parseInt(body.rating))) : null;
  } catch {
    return new Response('Invalid JSON', { status: 400, headers: CORS });
  }

  if (!message && !rating) return new Response('Missing message or rating', { status: 400, headers: CORS });

  // Insert into feedback table
  const insertRes = await fetch(`${SUPABASE_URL}/rest/v1/feedback`, {
    method: 'POST',
    headers: {
      'apikey': SUPABASE_SERVICE_KEY,
      'Authorization': `Bearer ${SUPABASE_SERVICE_KEY}`,
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal',
    },
    body: JSON.stringify({ message, email, rating }),
  });

  if (!insertRes.ok) {
    const err = await insertRes.text();
    return new Response(`DB error: ${err}`, { status: 500, headers: CORS });
  }

  // Send notification email
  const replyTo = email ? [email] : undefined;
  const fromLine = email ? `de <strong>${email}</strong>` : 'anonyme';
  const starsHtml = rating ? `<div style="font-size:1.4em;margin:0 0 16px;letter-spacing:2px">${'★'.repeat(rating)}${'☆'.repeat(5 - rating)}</div>` : '';
  const messageHtml = message ? `<div style="background:#f1f5f9;border-left:4px solid #2d8a3e;border-radius:0 8px 8px 0;padding:16px 18px;margin:20px 0;color:#1e293b;font-size:0.95em;line-height:1.7;white-space:pre-wrap;">${message.replace(/</g, '&lt;').replace(/>/g, '&gt;')}</div>` : '';
  const subjectRating = rating ? ` · ${'★'.repeat(rating)}` : '';
  await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: 'Guide 100% Pool <guide@100pool.ca>',
      to: NOTIFY_EMAIL,
      ...(replyTo ? { reply_to: replyTo } : {}),
      subject: `💬 Nouveau commentaire${email ? ` — ${email}` : ''}${subjectRating}`,
      html: `
        <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;max-width:520px;margin:0 auto;padding:32px 24px;background:#f8fafc;">
          <div style="background:white;border-radius:16px;padding:36px;box-shadow:0 2px 12px rgba(0,0,0,0.06);">
            <img src="https://100pool.ca/100pool.jpg" alt="100% Pool" style="width:48px;height:48px;border-radius:10px;margin-bottom:16px;">
            <h2 style="font-size:1.1em;font-weight:800;color:#1e293b;margin:0 0 6px;">Nouveau commentaire ${fromLine}</h2>
            ${starsHtml}
            ${messageHtml}
            ${email ? `<p style="color:#64748b;font-size:0.82em;margin:0;">Réponds directement à cet email pour contacter l'utilisateur.</p>` : '<p style="color:#94a3b8;font-size:0.82em;margin:0;">Aucun email fourni — réponse impossible.</p>'}
            <hr style="border:none;border-top:1px solid #e2e8f0;margin:20px 0;">
            <a href="https://100pool.ca/admin" style="color:#2d8a3e;font-size:0.82em;font-weight:600;text-decoration:none;">Voir dans le dashboard admin →</a>
          </div>
        </div>
      `,
    }),
  });

  return new Response('OK', { status: 200, headers: CORS });
});
