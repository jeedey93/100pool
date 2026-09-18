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
#${SIDEBAR_ID} { width: 220px; min-height: 100vh; background: #ffffff; display: flex; flex-direction: column; position: fixed; left: 0; top: 0; bottom: 0; z-index: 300; border-right: 1px solid #e2e8f0; transition: width 0.2s ease; overflow: hidden; }
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

.sb-user-chip { display: flex; align-items: center; gap: 8px; background: #f0f4f8; border-bottom: 1px solid #e2e8f0; padding: 8px 14px; overflow: hidden; }
.sb-user-avatar { width: 26px; height: 26px; border-radius: 50%; background: #1a5c28; color: white; font-size: 0.62em; font-weight: 800; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.sb-user-email { color: #475569; font-size: 0.75em; font-weight: 600; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }

#${SIDEBAR_ID} .sidebar-logo { display: flex; align-items: center; gap: 13px; padding: 22px 20px 18px; border-bottom: 1px solid #e2e8f0; text-decoration: none; flex-shrink: 0; background: linear-gradient(135deg, #1a5c28, #2d8a3e); }
#${SIDEBAR_ID} .sidebar-logo img { width: 38px; height: 38px; border-radius: 50%; object-fit: cover; border: 2px solid rgba(255,255,255,0.3); flex-shrink: 0; }
#${SIDEBAR_ID} .sidebar-logo-text { line-height: 1; }
#${SIDEBAR_ID} .sidebar-logo-text span { display: block; color: white; font-weight: 800; font-size: 1em; letter-spacing: -0.2px; }
#${SIDEBAR_ID} .sidebar-logo-text small { display: block; color: rgba(255,255,255,0.65); font-size: 0.65em; font-weight: 500; letter-spacing: 0.4px; margin-top: 2px; }
#${SIDEBAR_ID} .sidebar-section { padding: 18px 10px 4px; }
#${SIDEBAR_ID} .sidebar-section-label { font-size: 0.58em; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 1.4px; padding: 0 10px; margin-bottom: 6px; }
#${SIDEBAR_ID} .gs-nav-item { display: flex; align-items: center; gap: 10px; padding: 9px 14px; border-radius: 10px; cursor: pointer; color: #374151; font-size: 0.87em; font-weight: 600; transition: all 0.18s; border: none; background: none; width: 100%; text-align: left; letter-spacing: 0.1px; text-decoration: none; box-sizing: border-box; }
#${SIDEBAR_ID} .gs-nav-item:hover { background: #f0f4f8; color: #111827; }
#${SIDEBAR_ID} .gs-nav-item.active { background: #e8f5ec; color: #1a5c28; box-shadow: inset 0 0 0 1px rgba(26,92,40,0.15); font-weight: 700; }
#${SIDEBAR_ID} .gs-nav-icon { font-size: 1.05em; width: 20px; text-align: center; flex-shrink: 0; }
#${SIDEBAR_ID} .sidebar-bottom { margin-top: auto; padding: 12px 10px 14px; border-top: 1px solid #e2e8f0; }
#${SIDEBAR_ID} .sidebar-version { text-align: center; font-size: 0.58em; color: #cbd5e1; padding: 8px 0 4px; letter-spacing: 0.5px; }
#${SIDEBAR_ID} .sidebar-toggle { display: flex; align-items: center; gap: 8px; width: 100%; padding: 10px 14px; background: none; border: none; border-top: 1px solid #e2e8f0; cursor: pointer; color: #94a3b8; font-size: 0.82em; font-weight: 600; transition: all 0.18s; }
#${SIDEBAR_ID} .sidebar-toggle:hover { background: #f0f4f8; color: #475569; }
#${SIDEBAR_ID} .sidebar-toggle .toggle-icon { width: 20px; height: 20px; flex-shrink: 0; display: flex; align-items: center; justify-content: center; transition: transform 0.2s; }
#${SIDEBAR_ID} .sidebar-toggle .toggle-label { white-space: nowrap; overflow: hidden; }

#${SIDEBAR_ID} .gs-nav-children { position: relative; margin: 2px 0 4px 20px; padding-left: 12px; border-left: 2px solid #e2e8f0; }
#${SIDEBAR_ID} .gs-nav-sub { font-size: 0.82em; padding: 8px 12px; color: #64748b; }
#${SIDEBAR_ID} .gs-nav-sub .gs-nav-icon { font-size: 0.95em; width: 18px; }
#${SIDEBAR_ID} .gs-nav-sub:hover { color: #111827; background: #f0f4f8; border-radius: 10px; }
#${SIDEBAR_ID} .gs-nav-sub.active { color: #1a5c28; background: #e8f5ec; box-shadow: inset 0 0 0 1px rgba(26,92,40,0.15); border-radius: 10px; font-weight: 700; }
#${SIDEBAR_ID}.collapsed .gs-nav-children { display: none; }

body.has-shared-sidebar { padding-left: 220px; transition: padding-left 0.2s ease; }
body.has-shared-sidebar.shared-sb-collapsed { padding-left: 52px; }
@media (min-width: 769px) { body.has-shared-sidebar nav:not(#${SIDEBAR_ID}) { display: none !important; } }
@media (max-width: 768px) { #${SIDEBAR_ID} { display: none !important; } body.has-shared-sidebar { padding-left: 0 !important; } }

#sbBottomNav { display: none; }
@media (max-width: 768px) {
  #sbBottomNav { display: flex; position: fixed; bottom: 0; left: 0; right: 0; height: 58px; background: white; border-top: 1px solid #e2e8f0; z-index: 400; box-shadow: 0 -2px 12px rgba(0,0,0,0.08); }
  #sbBottomNav a { flex: 1; display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 3px; text-decoration: none; color: #94a3b8; font-size: 0.6em; font-weight: 700; letter-spacing: 0.3px; transition: color 0.15s; padding: 6px 2px 10px; }
  #sbBottomNav a:hover { color: #1a5c28; }
  #sbBottomNav a.active { color: #1a5c28; }
  #sbBottomNav a .sbn-icon { font-size: 1.55em; line-height: 1; }
  body.has-shared-sidebar { padding-bottom: 58px; }
}`;

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
  <div class="sidebar-version">Guide 2026-27 · v1.451</div>
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

  // Bottom nav (mobile only)
  const bottomNavLinks = [
    { href: '/',                         icon: '🏠', label: 'Accueil' },
    { href: '/guide-poolers/2026-2027/', icon: '📋', label: 'Guide' },
    { href: '/ma-liste/',               icon: '⭐', label: 'Ma liste' },
    { href: '/mon-equipe/',              icon: '👥', label: 'Équipe' },
    { href: '/podcast/',                 icon: '🎙', label: 'Podcast' },
  ];
  const bottomNavHtml = `<div id="sbBottomNav">${bottomNavLinks.map(l =>
    `<a href="${l.href}" class="${isActive(l.href) ? 'active' : ''}">
      <span class="sbn-icon">${l.icon}</span>${l.label}
    </a>`
  ).join('')}</div>`;
  document.body.insertAdjacentHTML('beforeend', bottomNavHtml);

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
  #sbFeedbackBox { background: white; border-radius: 18px; box-shadow: 0 24px 60px rgba(0,0,0,0.2); padding: 32px 32px 26px; max-width: 560px; width: 100%; animation: sbScaleIn 0.18s cubic-bezier(0.34,1.56,0.64,1); }
  @keyframes sbScaleIn { from { transform: scale(0.92); opacity: 0; } to { transform: scale(1); opacity: 1; } }
  #sbFeedbackBox h3 { font-size: 1.05em; font-weight: 900; color: #0f172a; margin-bottom: 6px; }
  #sbFeedbackBox p { font-size: 0.83em; color: #64748b; margin-bottom: 14px; line-height: 1.5; }
  #sbFeedbackEmail { width: 100%; padding: 10px 14px; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 0.88em; font-family: inherit; color: #1e293b; outline: none; box-sizing: border-box; margin-bottom: 10px; transition: border 0.15s; }
  #sbFeedbackEmail:focus { border-color: #2d8a3e; }
  #sbFeedbackMsg { width: 100%; border: 1.5px solid #e2e8f0; border-radius: 10px; padding: 12px 14px; font-size: 0.88em; font-family: inherit; resize: vertical; min-height: 160px; outline: none; transition: border 0.15s; color: #1e293b; box-sizing: border-box; }
  #sbFeedbackMsg:focus { border-color: #2d8a3e; }
  .sb-rating { display: flex; gap: 6px; margin-bottom: 14px; }
  .sb-star { font-size: 1.6em; cursor: pointer; color: #e2e8f0; transition: color 0.1s, transform 0.1s; line-height: 1; user-select: none; }
  .sb-star:hover, .sb-star.active { color: #f59e0b; transform: scale(1.15); }
  .sb-rating-label { font-size: 0.78em; color: #94a3b8; margin-bottom: 10px; font-weight: 600; }
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
      <div class="sb-rating-label">Ta satisfaction (optionnel)</div>
      <div class="sb-rating" id="sbStars">
        <span class="sb-star" data-val="1">★</span>
        <span class="sb-star" data-val="2">★</span>
        <span class="sb-star" data-val="3">★</span>
        <span class="sb-star" data-val="4">★</span>
        <span class="sb-star" data-val="5">★</span>
      </div>
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
    window._sbSelectedRating = 0;
    document.querySelectorAll('.sb-star').forEach(s => s.classList.remove('active'));
    document.getElementById('sbFeedbackOverlay').classList.remove('hidden');
  };

  // Star rating interaction
  let _sbRating = 0;
  document.getElementById('sbStars').addEventListener('mouseover', e => {
    const val = +e.target.dataset.val;
    if (!val) return;
    document.querySelectorAll('.sb-star').forEach(s => s.classList.toggle('active', +s.dataset.val <= val));
  });
  document.getElementById('sbStars').addEventListener('mouseout', () => {
    document.querySelectorAll('.sb-star').forEach(s => s.classList.toggle('active', +s.dataset.val <= _sbRating));
  });
  document.getElementById('sbStars').addEventListener('click', e => {
    const val = +e.target.dataset.val;
    if (!val) return;
    _sbRating = val;
    document.querySelectorAll('.sb-star').forEach(s => s.classList.toggle('active', +s.dataset.val <= _sbRating));
  });

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
    if (!msg && !_sbRating) return;
    const btn = document.getElementById('sbFeedbackSendBtn');
    btn.disabled = true; btn.textContent = 'Envoi…';
    const emailInput = (document.getElementById('sbFeedbackEmail').value || '').trim().toLowerCase() || null;
    if (emailInput) localStorage.setItem('pool_user_email', emailInput);
    const userEmail = emailInput || localStorage.getItem('pool_user_email') || null;
    try {
      const res = await fetch(`${SUPABASE_URL}/functions/v1/submit-feedback`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', ...SB_HEADERS },
        body: JSON.stringify({ message: msg || null, email: userEmail, rating: _sbRating || null })
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
