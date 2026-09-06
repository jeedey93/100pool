const CACHE = '100pool-guide-v2';
const PLAYERS_CACHE = '100pool-players-v2';

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

  // Ignore non-http requests (chrome-extension, etc.)
  if (!url.protocol.startsWith('http')) return;

  // Supabase players API — network-first, cache by URL only (headers stripped for cache key)
  if (url.hostname.includes('supabase.co') && url.pathname.includes('poolers_players')) {
    e.respondWith(
      fetch(e.request).then(res => {
        if (res.ok) {
          const toCache = res.clone();
          caches.open(PLAYERS_CACHE).then(cache => cache.put(url.href, toCache));
        }
        return res;
      }).catch(async () => {
        // Offline fallback — serve cached players
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

  // All other Supabase calls (auth, validate) — network only, no interference
  if (url.hostname.includes('supabase.co')) {
    return; // Let browser handle it normally
  }

  // App shell — cache-first
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
