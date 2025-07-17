'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5dcc82ee6be98b34de91a3fbe16fa4b3",
"version.json": "8b3fe9e91e75627f12ecbc96fe99ddcc",
"favicon.ico": "43bba0d7af21ec90bc3757a20de2a196",
"index.html": "4b8052e1688b6e11af8f0fcdc84a461b",
"/": "4b8052e1688b6e11af8f0fcdc84a461b",
"main.dart.js": "92af34ac6a7fed48507959f70904edba",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "6380187f5727884e71d4361465c8423c",
"icons/favicon-16x16.png": "6380187f5727884e71d4361465c8423c",
"icons/favicon.ico": "43bba0d7af21ec90bc3757a20de2a196",
"icons/apple-icon.png": "9431bae6bb1e0a00f1e1d2b2661d94a3",
"icons/apple-icon-144x144.png": "5a4ffacfde4207c813a4e6e24e3c3cc9",
"icons/android-icon-192x192.png": "9b8c7a27f6d40e3c022238c08ce6bc59",
"icons/apple-icon-precomposed.png": "9431bae6bb1e0a00f1e1d2b2661d94a3",
"icons/apple-icon-114x114.png": "b9b137f4f83db6d3bc2cd2e7738efb25",
"icons/ms-icon-310x310.png": "785b9f033a17d5868312f3407d67b876",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/ms-icon-144x144.png": "6b44fc52036f1814e2bfff807194c628",
"icons/apple-icon-57x57.png": "70bc03b3058a8a2d1504e4f3744cc0f1",
"icons/apple-icon-152x152.png": "6f8614a1598ea9fe3a2f3f0113553d0d",
"icons/ms-icon-150x150.png": "225e26c4b70f7ff8e16af8309735a78e",
"icons/android-icon-72x72.png": "47cf8855ece3d75f162ba8cba119a0b9",
"icons/android-icon-96x96.png": "bec293201537725f63a85344c5d51343",
"icons/android-icon-36x36.png": "8a7f3681bae2aef72609bc6a2c0276b0",
"icons/apple-icon-180x180.png": "2f1295e4774993b8d678e27644759141",
"icons/favicon-96x96.png": "3f593365ce5569e11702fa1a58f020f2",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/android-icon-48x48.png": "4dcdfa3721074be74067cbf1062d900b",
"icons/apple-icon-76x76.png": "f81e9711070cd9c1ae8253aa6b1f1629",
"icons/apple-icon-60x60.png": "d2d3183860820f39e5c9a3fcb5982b0c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-144x144.png": "5a4ffacfde4207c813a4e6e24e3c3cc9",
"icons/apple-icon-72x72.png": "47cf8855ece3d75f162ba8cba119a0b9",
"icons/apple-icon-120x120.png": "0cd996fb1b2bf5d46d8b9194db86796b",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/favicon-32x32.png": "7e2dff49e5daf8af23daccf06c9b3107",
"icons/ms-icon-70x70.png": "e192024c407c81244d039f7a8a57bda2",
"manifest.json": "14dff983c52d6b1702e33da054a811e4",
"assets/AssetManifest.json": "275f7291c25d7b8e2beb0d2d16c3baa4",
"assets/NOTICES": "9c9e49c40df397475b3354acb02ae186",
"assets/FontManifest.json": "174669c1879e2a22f5f91a9f4c575d3a",
"assets/AssetManifest.bin.json": "9cc7650488f62e648cff3cd6bcfc4735",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "2c9ada2040368337831709c07e18e2aa",
"assets/fonts/MaterialIcons-Regular.otf": "549d52c39752f826d0aa72385d78712e",
"assets/assets/icons/zent.svg": "6aa05ca19b86a8e5c5a07a3d08a6b88b",
"assets/assets/icons/Phone.png": "39fb9bb0e50776b8141289178031ad1c",
"assets/assets/icons/Phone.svg": "133d53a159af38388cc5b063fd04645f",
"assets/assets/icons/rocket.svg": "07a67133cccff940ecf11c7af9c64ae9",
"assets/assets/manrope/manrope-semibold.otf": "809e36f11861afe527bda8afa0cce855",
"assets/assets/manrope/manrope-medium.otf": "313854186f7ab99de7ff2cd3a229435e",
"assets/assets/manrope/README.md": "a53dce7a89c245d1e2adcd4ee5df6339",
"assets/assets/manrope/manrope-bold.otf": "b2d6510428ad33823191bc451621d1a8",
"assets/assets/manrope/OFL.txt": "2fcaec0e88aa2184f928d27ff72284ed",
"assets/assets/manrope/manrope-light.otf": "78cfdc6416d964aad49d1d9012155f55",
"assets/assets/manrope/manrope-thin.otf": "acdc45e42b42c23a18d85d921ab2cfca",
"assets/assets/manrope/manrope.pdf": "62ee67b42f1550309ae14a20863725e8",
"assets/assets/manrope/manrope-extrabold.otf": "06d638c060302ca0b55d6dfba20686c8",
"assets/assets/manrope/manrope-regular.otf": "93bcdc811b863241e3c2f2472764c5c5",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
