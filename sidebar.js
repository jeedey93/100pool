// Shared sidebar — shown only when user has guide access
(function () {
  const isDev = location.hostname === 'localhost' || location.hostname === '127.0.0.1';
  if (!isDev && !localStorage.getItem('pool_pw_token') && !localStorage.getItem('pool_token')) return;

  // Skip if the guide page already rendered its own sidebar
  if (document.getElementById('guideSidebar')) return;

  const SIDEBAR_ID = 'sharedSidebar';
  if (document.getElementById(SIDEBAR_ID)) return;

  const path = location.pathname.replace(/\/$/, '') || '/';
  const isActive = href => {
    const h = href.replace(/\/$/, '');
    return path === h || path.startsWith(h + '/');
  };

  const links = [
    { href: '/guide-poolers/2026-2027/', icon: '📋', label: 'Guide des poolers' },
    { href: '/mon-equipe/',              icon: '👥', label: 'Mon équipe' },
    { href: '/podcast/',                 icon: '🎙', label: 'Podcast' },
    { href: '/faq/',                     icon: '❓', label: 'FAQ' },
  ];

  const navItems = links.map(l => `
    <a class="gs-nav-item${isActive(l.href) ? ' active' : ''}" href="${l.href}">
      <span class="gs-nav-icon">${l.icon}</span><span>${l.label}</span>
    </a>`).join('');

  // Same CSS as the guide's inline sidebar — keeps both visually identical
  const css = `
#${SIDEBAR_ID} { width: 220px; min-height: 100vh; background: linear-gradient(180deg, #080f09 0%, #0f1f13 40%, #111e14 100%); display: flex; flex-direction: column; position: fixed; left: 0; top: 0; bottom: 0; z-index: 300; border-right: 1px solid rgba(255,255,255,0.05); transition: width 0.2s ease; overflow: hidden; }
#${SIDEBAR_ID}.collapsed { width: 52px; }
#${SIDEBAR_ID}.collapsed .sidebar-logo-text,
#${SIDEBAR_ID}.collapsed .sidebar-section-label,
#${SIDEBAR_ID}.collapsed .gs-nav-item span:not(.gs-nav-icon),
#${SIDEBAR_ID}.collapsed .sidebar-bottom a span,
#${SIDEBAR_ID}.collapsed .sidebar-bottom button span:not(.gs-nav-icon),
#${SIDEBAR_ID}.collapsed .sidebar-version { display: none; }
#${SIDEBAR_ID}.collapsed .gs-nav-item { justify-content: center; padding: 10px; }
#${SIDEBAR_ID}.collapsed .sidebar-logo { padding: 20px 7px; justify-content: center; }
#${SIDEBAR_ID}.collapsed .sidebar-bottom a,
#${SIDEBAR_ID}.collapsed .sidebar-bottom button { justify-content: center; padding: 8px; }
#${SIDEBAR_ID}.collapsed .sidebar-toggle { justify-content: center; padding: 10px; }
#${SIDEBAR_ID}.collapsed .sidebar-toggle .toggle-label { display: none; }
#${SIDEBAR_ID}.collapsed .sidebar-toggle .toggle-icon { transform: rotate(180deg); }

body.has-shared-sidebar { margin-left: 220px; transition: margin-left 0.2s ease; }
body.has-shared-sidebar.shared-sb-collapsed { margin-left: 52px; }

@media (min-width: 769px) { body.has-shared-sidebar nav { display: none !important; } }
@media (max-width: 768px) { #${SIDEBAR_ID} { display: none !important; } body.has-shared-sidebar { margin-left: 0 !important; } }

/* Shared sidebar reuses guide sidebar styles — these may already exist on the guide page */
.sidebar-logo { display: flex; align-items: center; gap: 13px; padding: 26px 20px 20px; border-bottom: 1px solid rgba(255,255,255,0.06); text-decoration: none; flex-shrink: 0; }
.sidebar-logo img { width: 38px; height: 38px; border-radius: 50%; object-fit: cover; border: 2px solid rgba(74,222,128,0.3); flex-shrink: 0; }
.sidebar-logo-text { line-height: 1; }
.sidebar-logo-text span { display: block; color: white; font-weight: 800; font-size: 1em; letter-spacing: -0.2px; }
.sidebar-logo-text small { display: block; color: rgba(255,255,255,0.35); font-size: 0.65em; font-weight: 500; letter-spacing: 0.4px; margin-top: 2px; }
.sidebar-section { padding: 18px 10px 4px; }
.sidebar-section-label { font-size: 0.58em; font-weight: 700; color: rgba(255,255,255,0.25); text-transform: uppercase; letter-spacing: 1.4px; padding: 0 10px; margin-bottom: 6px; }
.gs-nav-item { display: flex; align-items: center; gap: 10px; padding: 10px 14px; border-radius: 10px; cursor: pointer; color: rgba(255,255,255,0.5); font-size: 0.87em; font-weight: 600; transition: all 0.18s; border: none; background: none; width: 100%; text-align: left; letter-spacing: 0.1px; text-decoration: none; box-sizing: border-box; }
.gs-nav-item:hover { background: rgba(255,255,255,0.06); color: rgba(255,255,255,0.85); }
.gs-nav-item.active { background: linear-gradient(135deg, rgba(45,138,62,0.22), rgba(74,222,128,0.1)); color: #4ade80; box-shadow: inset 0 0 0 1px rgba(74,222,128,0.15); }
.gs-nav-icon { font-size: 1.05em; width: 20px; text-align: center; flex-shrink: 0; }
.sidebar-bottom { margin-top: auto; padding: 12px 10px 14px; border-top: 1px solid rgba(255,255,255,0.06); }
.sidebar-version { text-align: center; font-size: 0.58em; color: rgba(255,255,255,0.15); padding: 8px 0 4px; letter-spacing: 0.5px; }
.sidebar-toggle { display: flex; align-items: center; gap: 8px; width: 100%; padding: 10px 14px; background: none; border: none; border-top: 1px solid rgba(255,255,255,0.06); cursor: pointer; color: rgba(255,255,255,0.3); font-size: 0.82em; font-weight: 600; transition: all 0.18s; }
.sidebar-toggle:hover { background: rgba(255,255,255,0.05); color: rgba(255,255,255,0.65); }
.sidebar-toggle .toggle-icon { width: 20px; height: 20px; flex-shrink: 0; display: flex; align-items: center; justify-content: center; transition: transform 0.2s; }
.sidebar-toggle .toggle-label { white-space: nowrap; overflow: hidden; }`;

  const html = `
<nav id="${SIDEBAR_ID}">
  <a class="sidebar-logo" href="/">
    <img src="/100pool.jpg" alt="100% Pool">
    <div class="sidebar-logo-text">
      <span>100% Pool</span>
      <small>Guide 2026-27</small>
    </div>
  </a>
  <div class="sidebar-section">
    <div class="sidebar-section-label">Navigation</div>
    ${navItems}
  </div>
  <div class="sidebar-bottom">
    <a class="gs-nav-item" href="/">
      <span class="gs-nav-icon">🏠</span><span>Accueil</span>
    </a>
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
})();
