// Shared sidebar — shown only when user has guide access (pool_pw_token in localStorage)
(function () {
  // Skip if page already has its own sidebar (e.g. guide-poolers/2026-2027)
  if (document.getElementById('guideSidebar')) return;
  // On localhost, always show sidebar for development
  const isDev = location.hostname === 'localhost' || location.hostname === '127.0.0.1';
  // User has access if either token is present
  if (!isDev && !localStorage.getItem('pool_pw_token') && !localStorage.getItem('pool_token')) return;

  const path = location.pathname.replace(/\/$/, '') || '/';

  const links = [
    { href: '/guide-poolers/2026-2027/', icon: '📋', label: 'Guide des poolers' },
    { href: '/mon-equipe/',              icon: '👥', label: 'Mon équipe' },
    { href: '/podcast/',                 icon: '🎙', label: 'Podcast' },
    { href: '/faq/',                     icon: '❓', label: 'FAQ' },
  ];

  const isActive = href => {
    const h = href.replace(/\/$/, '');
    return path === h || path.startsWith(h + '/');
  };

  const navItems = links.map(l => `
    <a class="sb-item${isActive(l.href) ? ' sb-active' : ''}" href="${l.href}">
      <span class="sb-icon">${l.icon}</span><span class="sb-label">${l.label}</span>
    </a>`).join('');

  const html = `
<nav class="shared-sidebar" id="sharedSidebar">
  <a class="sb-logo" href="/">
    <img src="/100pool.jpg" alt="100% Pool">
    <div class="sb-logo-text">
      <span>100% Pool</span>
      <small>Guide 2026-27</small>
    </div>
  </a>
  <div class="sb-section">
    <div class="sb-section-label">Navigation</div>
    ${navItems}
  </div>
  <div class="sb-bottom">
    <a class="sb-item" href="/">
      <span class="sb-icon">🏠</span><span class="sb-label">Accueil</span>
    </a>
  </div>
  <div class="sb-version">Guide 2026-27</div>
  <button class="sb-toggle" id="sbToggle" title="Réduire">
    <span class="sb-toggle-icon">
      <svg width="16" height="16" viewBox="0 0 16 16" fill="none">
        <path d="M10 3L5 8L10 13" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    </span>
    <span class="sb-toggle-label">Réduire</span>
  </button>
</nav>`;

  const css = `
.shared-sidebar {
  width: 220px; min-height: 100vh;
  background: linear-gradient(180deg, #080f09 0%, #0f1f13 40%, #111e14 100%);
  display: flex; flex-direction: column;
  position: fixed; left: 0; top: 0; bottom: 0; z-index: 300;
  border-right: 1px solid rgba(255,255,255,0.05);
  transition: width 0.2s ease; overflow: hidden;
}
.shared-sidebar.sb-collapsed { width: 52px; }
.shared-sidebar.sb-collapsed .sb-logo-text,
.shared-sidebar.sb-collapsed .sb-section-label,
.shared-sidebar.sb-collapsed .sb-item .sb-label,
.shared-sidebar.sb-collapsed .sb-bottom .sb-label,
.shared-sidebar.sb-collapsed .sb-version,
.shared-sidebar.sb-collapsed .sb-toggle-label { display: none; }
.shared-sidebar.sb-collapsed .sb-item { justify-content: center; padding: 10px; }
.shared-sidebar.sb-collapsed .sb-logo { padding: 20px 7px; justify-content: center; }
.shared-sidebar.sb-collapsed .sb-bottom .sb-item { justify-content: center; padding: 8px; }
.shared-sidebar.sb-collapsed .sb-toggle { justify-content: center; padding: 10px; }
.shared-sidebar.sb-collapsed .sb-toggle-icon { transform: rotate(180deg); }

.sb-logo { display: flex; align-items: center; gap: 13px; padding: 26px 20px 20px; border-bottom: 1px solid rgba(255,255,255,0.06); text-decoration: none; flex-shrink: 0; }
.sb-logo img { width: 38px; height: 38px; border-radius: 50%; object-fit: cover; border: 2px solid rgba(74,222,128,0.3); flex-shrink: 0; }
.sb-logo-text { line-height: 1; }
.sb-logo-text span { display: block; color: white; font-weight: 800; font-size: 1em; letter-spacing: -0.2px; }
.sb-logo-text small { display: block; color: rgba(255,255,255,0.35); font-size: 0.65em; font-weight: 500; letter-spacing: 0.4px; margin-top: 2px; }

.sb-section { padding: 18px 10px 4px; }
.sb-section-label { font-size: 0.58em; font-weight: 700; color: rgba(255,255,255,0.25); text-transform: uppercase; letter-spacing: 1.4px; padding: 0 10px; margin-bottom: 6px; }
.sb-item { display: flex; align-items: center; gap: 10px; padding: 10px 14px; border-radius: 10px; cursor: pointer; color: rgba(255,255,255,0.5); font-size: 0.87em; font-weight: 600; transition: all 0.18s; border: none; background: none; width: 100%; text-align: left; text-decoration: none; box-sizing: border-box; }
.sb-item:hover { background: rgba(255,255,255,0.06); color: rgba(255,255,255,0.85); }
.sb-item.sb-active { background: linear-gradient(135deg, rgba(45,138,62,0.22), rgba(74,222,128,0.1)); color: #4ade80; box-shadow: inset 0 0 0 1px rgba(74,222,128,0.15); }
.sb-icon { font-size: 1.05em; width: 20px; text-align: center; flex-shrink: 0; }

.sb-bottom { margin-top: auto; padding: 12px 10px 14px; border-top: 1px solid rgba(255,255,255,0.06); }
.sb-version { text-align: center; font-size: 0.58em; color: rgba(255,255,255,0.15); padding: 8px 0 4px; letter-spacing: 0.5px; }
.sb-toggle { display: flex; align-items: center; gap: 8px; width: 100%; padding: 10px 14px; background: none; border: none; border-top: 1px solid rgba(255,255,255,0.06); cursor: pointer; color: rgba(255,255,255,0.3); font-size: 0.82em; font-weight: 600; transition: all 0.18s; }
.sb-toggle:hover { background: rgba(255,255,255,0.05); color: rgba(255,255,255,0.65); }
.sb-toggle-icon { width: 20px; height: 20px; flex-shrink: 0; display: flex; align-items: center; justify-content: center; transition: transform 0.2s; }
.sb-toggle-label { white-space: nowrap; overflow: hidden; }

/* Push page content right */
body.has-shared-sidebar { padding-left: 220px; transition: padding-left 0.2s ease; }
body.has-shared-sidebar.sb-body-collapsed { padding-left: 52px; }

/* Hide top nav on desktop when sidebar is present */
@media (min-width: 769px) {
  body.has-shared-sidebar nav:not(.shared-sidebar):not(.guide-sidebar) { display: none !important; }
}

/* Hide sidebar on mobile */
@media (max-width: 768px) {
  .shared-sidebar { display: none !important; }
  body.has-shared-sidebar { padding-left: 0 !important; }
}`;

  // Inject CSS
  const style = document.createElement('style');
  style.textContent = css;
  document.head.appendChild(style);

  // Inject HTML
  const wrap = document.createElement('div');
  wrap.innerHTML = html;
  document.body.insertBefore(wrap.firstElementChild, document.body.firstChild);

  // Apply collapsed state
  const sidebar = document.getElementById('sharedSidebar');
  const collapsed = localStorage.getItem('shared_sidebar_collapsed') === '1';
  if (collapsed) {
    sidebar.classList.add('sb-collapsed');
    document.body.classList.add('sb-body-collapsed');
  }
  document.body.classList.add('has-shared-sidebar');

  // Toggle
  document.getElementById('sbToggle').addEventListener('click', () => {
    const c = sidebar.classList.toggle('sb-collapsed');
    document.body.classList.toggle('sb-body-collapsed', c);
    localStorage.setItem('shared_sidebar_collapsed', c ? '1' : '0');
  });
})();
