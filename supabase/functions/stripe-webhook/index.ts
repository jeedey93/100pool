import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';

const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_SERVICE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY')!;
const WEBHOOK_SECRET = Deno.env.get('STRIPE_WEBHOOK_SECRET')!;

async function verifyStripeSignature(body: string, header: string, secret: string): Promise<boolean> {
  const parts = Object.fromEntries(header.split(',').map(p => p.split('=')));
  const timestamp = parts['t'];
  const signature = parts['v1'];
  if (!timestamp || !signature) return false;

  const payload = `${timestamp}.${body}`;
  const key = await crypto.subtle.importKey(
    'raw',
    new TextEncoder().encode(secret),
    { name: 'HMAC', hash: 'SHA-256' },
    false,
    ['sign']
  );
  const sig = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(payload));
  const computed = Array.from(new Uint8Array(sig)).map(b => b.toString(16).padStart(2, '0')).join('');
  return computed === signature;
}

serve(async (req) => {
  if (req.method !== 'POST') return new Response('Method not allowed', { status: 405 });

  const body = await req.text();
  const sig = req.headers.get('stripe-signature') || '';

  const valid = await verifyStripeSignature(body, sig, WEBHOOK_SECRET);
  if (!valid) {
    console.error('Invalid Stripe signature');
    return new Response('Invalid signature', { status: 400 });
  }

  const event = JSON.parse(body);
  if (event.type !== 'checkout.session.completed') {
    return new Response('OK', { status: 200 });
  }

  const session = event.data.object;
  const email = session.customer_details?.email || session.customer_email;

  if (!email) {
    console.error('No email found in session', session.id);
    return new Response('No email', { status: 400 });
  }

  // Insert access token via REST API
  const dbRes = await fetch(`${SUPABASE_URL}/rest/v1/poolers_access`, {
    method: 'POST',
    headers: {
      'apikey': SUPABASE_SERVICE_KEY,
      'Authorization': `Bearer ${SUPABASE_SERVICE_KEY}`,
      'Content-Type': 'application/json',
      'Prefer': 'return=representation',
    },
    body: JSON.stringify({ email, product: 'guide_2026_27' }),
  });

  if (!dbRes.ok) {
    const err = await dbRes.text();
    console.error('Failed to insert access token:', err);
    return new Response('DB error', { status: 500 });
  }

  const [row] = await dbRes.json();
  const token = row.token;
  const magicLink = `https://100pool.ca/guide-poolers/2026-2027/?token=${token}`;

  // Send magic link email via Resend
  const emailRes = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: 'Guide 100% Pool <guide@100pool.ca>',
      to: email,
      subject: 'Votre accès au Guide des poolers 2026-27 🏒',
      html: `
        <div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;max-width:520px;margin:0 auto;padding:32px 24px;background:#f8fafc;">
          <div style="background:white;border-radius:16px;padding:36px;box-shadow:0 2px 12px rgba(0,0,0,0.06);">
            <img src="https://100pool.ca/100pool.jpg" alt="100% Pool" style="width:64px;height:64px;border-radius:14px;margin-bottom:20px;">
            <h1 style="font-size:1.4em;font-weight:800;color:#1e293b;margin:0 0 8px;">Merci pour votre achat! 🎉</h1>
            <p style="color:#475569;font-size:0.95em;line-height:1.6;margin:0 0 24px;">
              Votre accès au <strong>Guide des poolers 100% Pool 2026-27</strong> est prêt.
              Cliquez sur le bouton ci-dessous pour accéder au guide — aucun mot de passe requis.
            </p>
            <a href="${magicLink}" style="display:inline-block;background:#2d8a3e;color:white;font-weight:700;font-size:1em;padding:14px 28px;border-radius:10px;text-decoration:none;">
              Accéder au Guide →
            </a>
            <p style="color:#94a3b8;font-size:0.78em;margin-top:24px;line-height:1.5;">
              Ce lien est personnel — gardez-le en sécurité. Il est valide pour un an.<br>
              Si vous avez des questions, répondez à ce courriel.
            </p>
          </div>
        </div>
      `,
    }),
  });

  if (!emailRes.ok) {
    const err = await emailRes.text();
    console.error('Failed to send email:', err);
  }

  console.log(`Access granted to ${email}, token: ${token}`);
  return new Response('OK', { status: 200 });
});
