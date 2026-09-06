const CACHE = '100pool-guide-v1';
const PLAYERS_CACHE = '100pool-players-v1';

const SHELL = [
  '/guide-poolers/2026-2027/',
  '/guide-poolers/2026-2027/index.html',
  '/100pool.jpg',
  '/100pool_large.png',
];

// Install: cache app shell
self.addEventListener('install', e => {
  e.waitUntil(
    caches.open(CACHE).then(c => c.addAll(SHELL)).then(() => self.skipWaiting())
  );
});

// Activate: clean old caches
self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys().then(keys =>
      Promise.all(keys.filter(k => k !== CACHE && k !== PLAYERS_CACHE).map(k => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', e => {
  const url = new URL(e.request.url);

  // Supabase players API — cache-first with network update
  if (url.hostname.includes('supabase.co') && url.pathname.includes('poolers_players')) {
    e.respondWith(
      caches.open(PLAYERS_CACHE).then(async cache => {
        const cached = await cache.match(e.request);
        const networkFetch = fetch(e.request).then(res => {
          if (res.ok) {
            cache.put(e.request, res.clone());
            // Notify clients that fresh data is available
            self.clients.matchAll().then(clients =>
              clients.forEach(c => c.postMessage({ type: 'PLAYERS_UPDATED' }))
            );
          }
          return res;
        }).catch(() => null);

        // Return cache immediately if available, else wait for network
        return cached || networkFetch;
      })
    );
    return;
  }

  // Supabase auth/validate calls — network only (no caching tokens)
  if (url.hostname.includes('supabase.co')) {
    e.respondWith(fetch(e.request).catch(() => new Response(JSON.stringify({ error: 'offline' }), {
      status: 503,
      headers: { 'Content-Type': 'application/json' }
    })));
    return;
  }

  // App shell — cache-first
  e.respondWith(
    caches.match(e.request).then(cached => cached || fetch(e.request).then(res => {
      if (res.ok && e.request.method === 'GET') {
        caches.open(CACHE).then(c => c.put(e.request, res.clone()));
      }
      return res;
    }))
  );
});
