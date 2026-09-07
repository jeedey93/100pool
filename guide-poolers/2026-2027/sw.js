const CACHE = '100pool-guide-v3';
const PLAYERS_CACHE = '100pool-players-v3';

const SHELL = [
  '/guide-poolers/2026-2027/',
  '/guide-poolers/2026-2027/index.html',
  '/100pool.jpg',
  '/100pool_large.png',
];

self.addEventListener('install', e => {
  e.waitUntil(
    caches.open(CACHE).then(c => c.addAll(SHELL)).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys().then(keys =>
      Promise.all(keys.filter(k => k !== CACHE && k !== PLAYERS_CACHE).map(k => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', e => {
  const url = new URL(e.request.url);

  // Ignore non-http (chrome-extension, etc.)
  if (!url.protocol.startsWith('http')) return;

  // Supabase players — network-first, cache by URL (no auth headers in key)
  if (url.hostname.includes('supabase.co') && url.pathname.includes('poolers_players')) {
    e.respondWith(
      fetch(e.request).then(res => {
        if (res.ok) {
          const toCache = res.clone();
          caches.open(PLAYERS_CACHE).then(cache => cache.put(url.href, toCache));
          self.clients.matchAll().then(clients =>
            clients.forEach(c => c.postMessage({ type: 'PLAYERS_UPDATED' }))
          );
        }
        return res;
      }).catch(async () => {
        const cache = await caches.open(PLAYERS_CACHE);
        const cached = await cache.match(url.href);
        if (cached) return cached;
        return new Response(JSON.stringify([]), {
          status: 200,
          headers: { 'Content-Type': 'application/json' }
        });
      })
    );
    return;
  }

  // Other Supabase calls (auth/validate) — network only
  if (url.hostname.includes('supabase.co')) return;

  // HTML pages — network-first so updates are always fresh
  if (e.request.mode === 'navigate' || url.pathname.endsWith('.html') || url.pathname.endsWith('/')) {
    e.respondWith(
      fetch(e.request).then(res => {
        if (res.ok) {
          const toCache = res.clone();
          caches.open(CACHE).then(c => c.put(e.request, toCache));
        }
        return res;
      }).catch(() => caches.match(e.request))
    );
    return;
  }

  // Static assets (images, etc.) — cache-first
  e.respondWith(
    caches.match(e.request).then(cached => cached || fetch(e.request).then(res => {
      if (res.ok && e.request.method === 'GET') {
        const toCache = res.clone();
        caches.open(CACHE).then(c => c.put(e.request, toCache));
      }
      return res;
    }))
  );
});
