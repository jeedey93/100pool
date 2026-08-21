import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import Stripe from 'https://esm.sh/stripe@14.21.0?target=deno';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2?target=deno';

const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY')!, { apiVersion: '2023-10-16' });
const webhookSecret = Deno.env.get('STRIPE_WEBHOOK_SECRET')!;
const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
);
const RESEND_API_KEY = Deno.env.get('RESEND_API_KEY')!;

serve(async (req) => {
  if (req.method !== 'POST') return new Response('Method not allowed', { status: 405 });

  const body = await req.text();
  const sig = req.headers.get('stripe-signature');

  let event: Stripe.Event;
  try {
    event = stripe.webhooks.constructEvent(body, sig!, webhookSecret);
  } catch (err) {
    console.error('Webhook signature verification failed:', err.message);
    return new Response(`Webhook Error: ${err.message}`, { status: 400 });
  }

  if (event.type !== 'checkout.session.completed') {
    return new Response('OK', { status: 200 });
  }

  const session = event.data.object as Stripe.Checkout.Session;
  const email = session.customer_details?.email || session.customer_email;

  if (!email) {
    console.error('No email found in session', session.id);
    return new Response('No email', { status: 400 });
  }

  // Insert access token
  const { data: access, error } = await supabase
    .from('poolers_access')
    .insert({ email, product: 'guide_2026_27' })
    .select('token')
    .single();

  if (error) {
    console.error('Failed to insert access token:', error.message);
    return new Response('DB error', { status: 500 });
  }

  const token = access.token;
  const magicLink = `https://100pool.ca/2026-27/?token=${token}`;

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
    // Don't fail the webhook — access was created, user can contact support
  }

  console.log(`Access granted to ${email}, token: ${token}`);
  return new Response('OK', { status: 200 });
});
