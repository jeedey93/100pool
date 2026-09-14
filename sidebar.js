// Shared sidebar v3 — shown only when user has guide access
(function () {
  const isDev = location.hostname === 'localhost' || location.hostname === '127.0.0.1';
  if (!isDev && !localStorage.getItem('pool_pw_token') && !localStorage.getItem('pool_token')) return;

  const SIDEBAR_ID = 'sharedSidebar';
  if (document.getElementById(SIDEBAR_ID)) return;

  const path = location.pathname.replace(/\/$/, '') || '/';
  const isActive = href => {
    const h = href.replace(/\/$/, '');
    if (h === '') return path === '';  // accueil exact uniquement
    return path === h || path.startsWith(h + '/');
  };

  const navLinks = [
    { href: '/',                         icon: '🏠', label: 'Accueil' },
    {
      href: '/guide-poolers/2026-2027/', icon: '📋', label: 'Guide des poolers',
      children: [
        { href: '/ma-liste/',   icon: '⭐', label: 'Ma liste' },
        { href: '/mon-equipe/', icon: '👥', label: 'Mon équipe' },
      ]
    },
    { href: '/podcast/', icon: '🎙', label: 'Podcast' },
    { href: '/faq/',     icon: '❓', label: 'FAQ' },
  ];

  const buildLink = (l, sub = false) => {
    const cls = ['gs-nav-item', isActive(l.href) ? 'active' : '', sub ? 'gs-nav-sub' : ''].filter(Boolean).join(' ');
    return `<a class="${cls}" href="${l.href}">
      <span class="gs-nav-icon">${l.icon}</span><span>${l.label}</span>
    </a>`;
  };

  const navHtml = `<div class="sidebar-section">
    <div class="sidebar-section-label">Navigation</div>
    ${navLinks.map(l => {
      if (!l.children) return buildLink(l);
      return `${buildLink(l)}
      <div class="gs-nav-children">
        ${l.children.map(c => buildLink(c, true)).join('')}
      </div>`;
    }).join('')}
  </div>`;

  const email = localStorage.getItem('pool_user_email') || '';
  const initials = email ? email.slice(0, 2).toUpperCase() : '';
  const userChipHtml = email ? `
  <div class="sb-user-chip">
    <div class="sb-user-avatar">${initials}</div>
    <span class="sb-user-email">${email}</span>
  </div>` : '';

  const css = `
#${SIDEBAR_ID} { width: 220px; min-height: 100vh; background: linear-gradient(180deg, #1a5c28 0%, #1e6b2e 40%, #2d8a3e 100%); display: flex; flex-direction: column; position: fixed; left: 0; top: 0; bottom: 0; z-index: 300; border-right: 1px solid rgba(0,0,0,0.15); transition: width 0.2s ease; overflow: hidden; }
#${SIDEBAR_ID}.collapsed { width: 52px; }
#${SIDEBAR_ID}.collapsed .sidebar-logo-text,
#${SIDEBAR_ID}.collapsed .sidebar-section-label,
#${SIDEBAR_ID}.collapsed .gs-nav-item span:not(.gs-nav-icon),
#${SIDEBAR_ID}.collapsed .sidebar-bottom a span,
#${SIDEBAR_ID}.collapsed .sidebar-bottom button span:not(.gs-nav-icon),
#${SIDEBAR_ID}.collapsed .sidebar-version,
#${SIDEBAR_ID}.collapsed .sb-user-email { display: none; }
#${SIDEBAR_ID}.collapsed .gs-nav-item { justify-content: center; padding: 10px; }
#${SIDEBAR_ID}.collapsed .sidebar-logo { padding: 20px 7px; justify-content: center; }
#${SIDEBAR_ID}.collapsed .sidebar-bottom a,
#${SIDEBAR_ID}.collapsed .sidebar-bottom button { justify-content: center; padding: 8px; }
#${SIDEBAR_ID}.collapsed .sidebar-toggle { justify-content: center; padding: 10px; }
#${SIDEBAR_ID}.collapsed .sidebar-toggle .toggle-label { display: none; }
#${SIDEBAR_ID}.collapsed .sidebar-toggle .toggle-icon { transform: rotate(180deg); }
#${SIDEBAR_ID}.collapsed .sb-user-chip { padding: 8px 7px; justify-content: center; }
#${SIDEBAR_ID}.collapsed .sb-user-avatar { flex-shrink: 0; }

.sb-user-chip { display: flex; align-items: center; gap: 8px; background: rgba(0,0,0,0.15); border-bottom: 1px solid rgba(0,0,0,0.12); padding: 8px 14px; overflow: hidden; }
.sb-user-avatar { width: 26px; height: 26px; border-radius: 50%; background: #f5c842; color: #1a3d10; font-size: 0.62em; font-weight: 800; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.sb-user-email { color: rgba(255,255,255,0.8); font-size: 0.75em; font-weight: 600; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }

#${SIDEBAR_ID} .sidebar-logo { display: flex; align-items: center; gap: 13px; padding: 26px 20px 20px; border-bottom: 1px solid rgba(0,0,0,0.12); text-decoration: none; flex-shrink: 0; }
#${SIDEBAR_ID} .sidebar-logo img { width: 38px; height: 38px; border-radius: 50%; object-fit: cover; border: 2px solid rgba(255,255,255,0.3); flex-shrink: 0; }
#${SIDEBAR_ID} .sidebar-logo-text { line-height: 1; }
#${SIDEBAR_ID} .sidebar-logo-text span { display: block; color: white; font-weight: 800; font-size: 1em; letter-spacing: -0.2px; }
#${SIDEBAR_ID} .sidebar-logo-text small { display: block; color: rgba(255,255,255,0.65); font-size: 0.65em; font-weight: 500; letter-spacing: 0.4px; margin-top: 2px; }
#${SIDEBAR_ID} .sidebar-section { padding: 18px 10px 4px; }
#${SIDEBAR_ID} .sidebar-section-label { font-size: 0.58em; font-weight: 700; color: rgba(255,255,255,0.5); text-transform: uppercase; letter-spacing: 1.4px; padding: 0 10px; margin-bottom: 6px; }
#${SIDEBAR_ID} .gs-nav-item { display: flex; align-items: center; gap: 10px; padding: 10px 14px; border-radius: 10px; cursor: pointer; color: rgba(255,255,255,0.85); font-size: 0.87em; font-weight: 600; transition: all 0.18s; border: none; background: none; width: 100%; text-align: left; letter-spacing: 0.1px; text-decoration: none; box-sizing: border-box; }
#${SIDEBAR_ID} .gs-nav-item:hover { background: rgba(0,0,0,0.12); color: white; }
#${SIDEBAR_ID} .gs-nav-item.active { background: rgba(0,0,0,0.2); color: #f5c842; box-shadow: inset 0 0 0 1px rgba(245,200,66,0.3); }
#${SIDEBAR_ID} .gs-nav-icon { font-size: 1.05em; width: 20px; text-align: center; flex-shrink: 0; }
#${SIDEBAR_ID} .sidebar-bottom { margin-top: auto; padding: 12px 10px 14px; border-top: 1px solid rgba(0,0,0,0.12); }
#${SIDEBAR_ID} .sidebar-version { text-align: center; font-size: 0.58em; color: rgba(255,255,255,0.4); padding: 8px 0 4px; letter-spacing: 0.5px; }
#${SIDEBAR_ID} .sidebar-toggle { display: flex; align-items: center; gap: 8px; width: 100%; padding: 10px 14px; background: none; border: none; border-top: 1px solid rgba(0,0,0,0.12); cursor: pointer; color: rgba(255,255,255,0.6); font-size: 0.82em; font-weight: 600; transition: all 0.18s; }
#${SIDEBAR_ID} .sidebar-toggle:hover { background: rgba(0,0,0,0.1); color: white; }
#${SIDEBAR_ID} .sidebar-toggle .toggle-icon { width: 20px; height: 20px; flex-shrink: 0; display: flex; align-items: center; justify-content: center; transition: transform 0.2s; }
#${SIDEBAR_ID} .sidebar-toggle .toggle-label { white-space: nowrap; overflow: hidden; }

#${SIDEBAR_ID} .gs-nav-children { position: relative; margin: 2px 0 4px 20px; padding-left: 12px; border-left: 1px solid rgba(255,255,255,0.25); }
#${SIDEBAR_ID} .gs-nav-sub { font-size: 0.82em; padding: 8px 12px; color: rgba(255,255,255,0.7); }
#${SIDEBAR_ID} .gs-nav-sub .gs-nav-icon { font-size: 0.95em; width: 18px; }
#${SIDEBAR_ID} .gs-nav-sub:hover { color: white; background: rgba(0,0,0,0.12); border-radius: 10px; }
#${SIDEBAR_ID} .gs-nav-sub.active { color: #f5c842; background: rgba(0,0,0,0.2); box-shadow: inset 0 0 0 1px rgba(245,200,66,0.3); border-radius: 10px; }
#${SIDEBAR_ID}.collapsed .gs-nav-children { display: none; }

body.has-shared-sidebar { padding-left: 220px; transition: padding-left 0.2s ease; }
body.has-shared-sidebar.shared-sb-collapsed { padding-left: 52px; }
@media (min-width: 769px) { body.has-shared-sidebar nav:not(#${SIDEBAR_ID}) { display: none !important; } }
@media (max-width: 768px) { #${SIDEBAR_ID} { display: none !important; } body.has-shared-sidebar { padding-left: 0 !important; } }`;

  const html = `
<nav id="${SIDEBAR_ID}">
  <a class="sidebar-logo" href="/">
    <img src="/100pool.jpg" alt="100% Pool">
    <div class="sidebar-logo-text">
      <span>100% Pool</span>
      <small>Guide 2026-27</small>
    </div>
  </a>
  ${userChipHtml}
  ${navHtml}
  <div class="sidebar-bottom" id="sbBottom">
    <button class="gs-nav-item" onclick="window._sbOpenFeedback()" style="width:100%">
      <span class="gs-nav-icon">💬</span><span>Commentaires</span>
    </button>
  </div>
  <div class="sidebar-version">Guide 2026-27</div>
  <button class="sidebar-toggle" id="sbToggleBtn" title="Réduire la navigation">
    <span class="toggle-icon"><svg width="16" height="16" viewBox="0 0 16 16" fill="none"><path d="M10 3L5 8L10 13" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg></span>
    <span class="toggle-label">Réduire</span>
  </button>
</nav>`;

  const style = document.createElement('style');
  style.textContent = css;
  document.head.appendChild(style);

  document.body.insertAdjacentHTML('afterbegin', html);
  document.body.classList.add('has-shared-sidebar');

  const sidebar = document.getElementById(SIDEBAR_ID);
  const collapsed = localStorage.getItem('shared_sidebar_collapsed') === '1';
  if (collapsed) {
    sidebar.classList.add('collapsed');
    document.body.classList.add('shared-sb-collapsed');
  }

  document.getElementById('sbToggleBtn').addEventListener('click', () => {
    const c = sidebar.classList.toggle('collapsed');
    document.body.classList.toggle('shared-sb-collapsed', c);
    localStorage.setItem('shared_sidebar_collapsed', c ? '1' : '0');
  });

  // Allow the host page to prepend extra buttons to sidebar-bottom
  // Usage: window._sidebarPrepend('<button ...>...</button>')
  window._sidebarPrepend = function(html) {
    const bottom = document.getElementById('sbBottom');
    if (bottom) bottom.insertAdjacentHTML('afterbegin', html);
  };

  // ── Feedback modal ──────────────────────────────────────────
  const SUPABASE_URL = 'https://fifurqlitkywtmhgtzeu.supabase.co';
  const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpZnVycWxpdGt5d3RtaGd0emV1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY3MDIyMjQsImV4cCI6MjA5MjI3ODIyNH0.KPVPj1qwbSJJMyLR_-AhDcRs0vi2sUU6qbFQ-kH53C0';
  const SB_HEADERS = { 'apikey': SUPABASE_KEY, 'Authorization': `Bearer ${SUPABASE_KEY}` };

  const feedbackStyle = `
  #sbFeedbackOverlay { position: fixed; inset: 0; background: rgba(15,23,42,0.55); z-index: 9999; display: flex; align-items: center; justify-content: center; padding: 20px; backdrop-filter: blur(5px); animation: sbFadeIn 0.15s ease; }
  #sbFeedbackOverlay.hidden { display: none; }
  @keyframes sbFadeIn { from { opacity: 0; } to { opacity: 1; } }
  #sbFeedbackBox { background: white; border-radius: 18px; box-shadow: 0 24px 60px rgba(0,0,0,0.2); padding: 28px 28px 22px; max-width: 420px; width: 100%; animation: sbScaleIn 0.18s cubic-bezier(0.34,1.56,0.64,1); }
  @keyframes sbScaleIn { from { transform: scale(0.92); opacity: 0; } to { transform: scale(1); opacity: 1; } }
  #sbFeedbackBox h3 { font-size: 1.05em; font-weight: 900; color: #0f172a; margin-bottom: 6px; }
  #sbFeedbackBox p { font-size: 0.83em; color: #64748b; margin-bottom: 14px; line-height: 1.5; }
  #sbFeedbackEmail { width: 100%; padding: 10px 14px; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 0.88em; font-family: inherit; color: #1e293b; outline: none; box-sizing: border-box; margin-bottom: 10px; transition: border 0.15s; }
  #sbFeedbackEmail:focus { border-color: #2d8a3e; }
  #sbFeedbackMsg { width: 100%; border: 1.5px solid #e2e8f0; border-radius: 10px; padding: 12px 14px; font-size: 0.88em; font-family: inherit; resize: vertical; min-height: 100px; outline: none; transition: border 0.15s; color: #1e293b; box-sizing: border-box; }
  #sbFeedbackMsg:focus { border-color: #2d8a3e; }
  .sb-feedback-actions { display: flex; gap: 10px; justify-content: flex-end; margin-top: 14px; }
  .sb-feedback-btn { font-size: 0.88em; font-weight: 700; padding: 9px 20px; border-radius: 9px; border: none; cursor: pointer; transition: all 0.15s; }
  .sb-feedback-cancel { background: #f1f5f9; color: #475569; }
  .sb-feedback-cancel:hover { background: #e2e8f0; }
  .sb-feedback-send { background: #2d8a3e; color: white; }
  .sb-feedback-send:hover { background: #1a6e2e; }
  .sb-feedback-send:disabled { opacity: 0.6; cursor: default; }
  #sbToast { position: fixed; bottom: 24px; left: 50%; transform: translateX(-50%) translateY(12px); background: #0f172a; color: white; font-size: 0.88em; font-weight: 600; padding: 10px 20px; border-radius: 10px; opacity: 0; pointer-events: none; transition: all 0.25s; z-index: 10000; white-space: nowrap; }
  #sbToast.show { opacity: 1; transform: translateX(-50%) translateY(0); }`;

  const feedbackHtml = `
  <div id="sbFeedbackOverlay" class="hidden" onclick="if(event.target===this)window._sbCloseFeedback()">
    <div id="sbFeedbackBox">
      <h3>💬 Laisser un commentaire</h3>
      <p>Une idée, une correction ou un feedback ? On lit tous les messages.</p>
      <input type="email" id="sbFeedbackEmail" placeholder="ton@email.com" autocomplete="email">
      <textarea id="sbFeedbackMsg" placeholder="Ton message…" maxlength="1000"></textarea>
      <div class="sb-feedback-actions">
        <button class="sb-feedback-btn sb-feedback-cancel" onclick="window._sbCloseFeedback()">Annuler</button>
        <button class="sb-feedback-btn sb-feedback-send" id="sbFeedbackSendBtn" onclick="window._sbSubmitFeedback()">Envoyer</button>
      </div>
    </div>
  </div>
  <div id="sbToast"></div>`;

  const feedbackStyleEl = document.createElement('style');
  feedbackStyleEl.textContent = feedbackStyle;
  document.head.appendChild(feedbackStyleEl);
  document.body.insertAdjacentHTML('beforeend', feedbackHtml);

  window._sbOpenFeedback = function() {
    document.getElementById('sbFeedbackMsg').value = '';
    document.getElementById('sbFeedbackEmail').value = localStorage.getItem('pool_user_email') || '';
    document.getElementById('sbFeedbackSendBtn').textContent = 'Envoyer';
    document.getElementById('sbFeedbackSendBtn').disabled = false;
    document.getElementById('sbFeedbackOverlay').classList.remove('hidden');
  };

  window._sbCloseFeedback = function() {
    document.getElementById('sbFeedbackOverlay').classList.add('hidden');
  };

  window._sbShowToast = function(msg) {
    const t = document.getElementById('sbToast');
    t.textContent = msg;
    t.classList.add('show');
    clearTimeout(t._t);
    t._t = setTimeout(() => t.classList.remove('show'), 3000);
  };

  window._sbSubmitFeedback = async function() {
    const msg = document.getElementById('sbFeedbackMsg').value.trim();
    if (!msg) return;
    const btn = document.getElementById('sbFeedbackSendBtn');
    btn.disabled = true; btn.textContent = 'Envoi…';
    const emailInput = (document.getElementById('sbFeedbackEmail').value || '').trim().toLowerCase() || null;
    if (emailInput) localStorage.setItem('pool_user_email', emailInput);
    const userEmail = emailInput || localStorage.getItem('pool_user_email') || null;
    try {
      const res = await fetch(`${SUPABASE_URL}/rest/v1/feedback`, {
        method: 'POST',
        headers: { ...SB_HEADERS, 'Content-Type': 'application/json', 'Prefer': 'return=minimal' },
        body: JSON.stringify({ message: msg, email: userEmail })
      });
      if (!res.ok) throw new Error();
      window._sbCloseFeedback();
      window._sbShowToast('✓ Merci ! Ton message a bien été envoyé.');
    } catch {
      btn.disabled = false; btn.textContent = 'Envoyer';
      window._sbShowToast('Erreur lors de l\'envoi. Réessaie.');
    }
  };
})();
