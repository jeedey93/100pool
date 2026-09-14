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

  const sections = [
    {
      label: 'Navigation',
      links: [
        { href: '/',                         icon: '🏠', label: 'Accueil' },
        { href: '/guide-poolers/2026-2027/', icon: '📋', label: 'Guide des poolers' },
        { href: '/faq/',                     icon: '❓', label: 'FAQ' },
      ]
    },
    {
      label: 'Outils',
      links: [
        { href: '/ma-liste/',   icon: '⭐', label: 'Ma liste' },
        { href: '/mon-equipe/', icon: '👥', label: 'Mon équipe' },
      ]
    },
    {
      label: 'Communauté',
      links: [
        { href: '/podcast/', icon: '🎙', label: 'Podcast' },
      ]
    },
  ];

  const navHtml = sections.map(s => `
    <div class="sidebar-section">
      <div class="sidebar-section-label">${s.label}</div>
      ${s.links.map(l => `<a class="gs-nav-item${isActive(l.href) ? ' active' : ''}" href="${l.href}">
        <span class="gs-nav-icon">${l.icon}</span><span>${l.label}</span>
      </a>`).join('')}
    </div>`).join('');

  const email = localStorage.getItem('pool_user_email') || '';
  const initials = email ? email.slice(0, 2).toUpperCase() : '';
  const userChipHtml = email ? `
  <div class="sb-user-chip">
    <div class="sb-user-avatar">${initials}</div>
    <span class="sb-user-email">${email}</span>
  </div>` : '';

  const css = `
#${SIDEBAR_ID} { width: 220px; min-height: 100vh; background: linear-gradient(180deg, #080f09 0%, #0f1f13 40%, #111e14 100%); display: flex; flex-direction: column; position: fixed; left: 0; top: 0; bottom: 0; z-index: 300; border-right: 1px solid rgba(255,255,255,0.05); transition: width 0.2s ease; overflow: hidden; }
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

.sb-user-chip { display: flex; align-items: center; gap: 8px; background: rgba(255,255,255,0.07); border-bottom: 1px solid rgba(255,255,255,0.06); padding: 8px 14px; overflow: hidden; }
.sb-user-avatar { width: 26px; height: 26px; border-radius: 50%; background: #f5c842; color: #1a3d10; font-size: 0.62em; font-weight: 800; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.sb-user-email { color: rgba(255,255,255,0.55); font-size: 0.75em; font-weight: 600; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }

#${SIDEBAR_ID} .sidebar-logo { display: flex; align-items: center; gap: 13px; padding: 26px 20px 20px; border-bottom: 1px solid rgba(255,255,255,0.06); text-decoration: none; flex-shrink: 0; }
#${SIDEBAR_ID} .sidebar-logo img { width: 38px; height: 38px; border-radius: 50%; object-fit: cover; border: 2px solid rgba(74,222,128,0.3); flex-shrink: 0; }
#${SIDEBAR_ID} .sidebar-logo-text { line-height: 1; }
#${SIDEBAR_ID} .sidebar-logo-text span { display: block; color: white; font-weight: 800; font-size: 1em; letter-spacing: -0.2px; }
#${SIDEBAR_ID} .sidebar-logo-text small { display: block; color: rgba(255,255,255,0.35); font-size: 0.65em; font-weight: 500; letter-spacing: 0.4px; margin-top: 2px; }
#${SIDEBAR_ID} .sidebar-section { padding: 18px 10px 4px; }
#${SIDEBAR_ID} .sidebar-section-label { font-size: 0.58em; font-weight: 700; color: rgba(255,255,255,0.25); text-transform: uppercase; letter-spacing: 1.4px; padding: 0 10px; margin-bottom: 6px; }
#${SIDEBAR_ID} .gs-nav-item { display: flex; align-items: center; gap: 10px; padding: 10px 14px; border-radius: 10px; cursor: pointer; color: rgba(255,255,255,0.5); font-size: 0.87em; font-weight: 600; transition: all 0.18s; border: none; background: none; width: 100%; text-align: left; letter-spacing: 0.1px; text-decoration: none; box-sizing: border-box; }
#${SIDEBAR_ID} .gs-nav-item:hover { background: rgba(255,255,255,0.06); color: rgba(255,255,255,0.85); }
#${SIDEBAR_ID} .gs-nav-item.active { background: linear-gradient(135deg, rgba(45,138,62,0.22), rgba(74,222,128,0.1)); color: #4ade80; box-shadow: inset 0 0 0 1px rgba(74,222,128,0.15); }
#${SIDEBAR_ID} .gs-nav-icon { font-size: 1.05em; width: 20px; text-align: center; flex-shrink: 0; }
#${SIDEBAR_ID} .sidebar-bottom { margin-top: auto; padding: 12px 10px 14px; border-top: 1px solid rgba(255,255,255,0.06); }
#${SIDEBAR_ID} .sidebar-version { text-align: center; font-size: 0.58em; color: rgba(255,255,255,0.15); padding: 8px 0 4px; letter-spacing: 0.5px; }
#${SIDEBAR_ID} .sidebar-toggle { display: flex; align-items: center; gap: 8px; width: 100%; padding: 10px 14px; background: none; border: none; border-top: 1px solid rgba(255,255,255,0.06); cursor: pointer; color: rgba(255,255,255,0.3); font-size: 0.82em; font-weight: 600; transition: all 0.18s; }
#${SIDEBAR_ID} .sidebar-toggle:hover { background: rgba(255,255,255,0.05); color: rgba(255,255,255,0.65); }
#${SIDEBAR_ID} .sidebar-toggle .toggle-icon { width: 20px; height: 20px; flex-shrink: 0; display: flex; align-items: center; justify-content: center; transition: transform 0.2s; }
#${SIDEBAR_ID} .sidebar-toggle .toggle-label { white-space: nowrap; overflow: hidden; }

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
})();
