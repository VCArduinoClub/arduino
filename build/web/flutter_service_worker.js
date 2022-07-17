'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "810514e42e8f1c280bc9ff27e196534a",
"assets/assets/images/AnalogDigitalExplain.PNG": "658ff858e89b742aca581acf4989864b",
"assets/assets/images/Arduino.png": "84321ecf76529676d55d4d878ec00e47",
"assets/assets/images/ArduinoPins.JPG": "ad192ba144b56c06ba6ca8c668451ef1",
"assets/assets/images/Arduino_Logo.png": "d945b13439aab4002755832ee92d825e",
"assets/assets/images/BlinkCode.PNG": "d6313fc1624756f8c4683f3f339decf1",
"assets/assets/images/Breadboard.png": "d2bbd5f21b4fe28b82ebd547ded3613e",
"assets/assets/images/BreadboardExplain.PNG": "e3bfdd1309f66c2adbb706deaaa6d881",
"assets/assets/images/Button.png": "88a264feb4e0bc79295152760a576ff3",
"assets/assets/images/ChallengePart1.jpg": "fb9abc55087cf26f9524d2f6124a95c4",
"assets/assets/images/ChallengePart2.jpg": "bae1d4161eefc0230da3bac10f747191",
"assets/assets/images/HelloWorldCode.PNG": "1cd6dc1c68cb1f5a976ca8cd86988df7",
"assets/assets/images/LED.png": "81d9e006ed77a59e1fbbb5a99fed08ef",
"assets/assets/images/LEDButtonCircuit.PNG": "e6e535923bf00aced1b545c71eb541a8",
"assets/assets/images/LEDButtonCode.PNG": "6e89c9bc3f728e5ef4ead815bcee0b7d",
"assets/assets/images/LEDCircuit.PNG": "04a8d999524505a4ffdb5d33c4aa3618",
"assets/assets/images/Photoresistor.png": "f088e92d57ed2a4807c806668766d494",
"assets/assets/images/PWMExplain.PNG": "791bbc9d871d9015f3400084f3d4c4ec",
"assets/assets/images/Resistor.png": "1f1fb1cf9bdb21e89187295c55c1ce66",
"assets/assets/images/SerialMonitor.JPG": "ebb4bcb850940e48bf7e8df95daa2291",
"assets/assets/images/UltrasonicExplain.PNG": "b44550ab7625260b36e70e6c6ab978c2",
"assets/assets/images/UltrasonicPart1.jpg": "d62155a4499adb7621358c0d3b4c1e8c",
"assets/assets/images/UltrasonicPart2.jpg": "f624d60b8d7365ed1467cc26a10875ae",
"assets/assets/images/Wire.png": "d625699c88140f4fbce85f909feca53c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "2d7236aca695ba4cd213a3478e55d740",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "162dce8852d10afaeec762414ab05c0e",
"/": "162dce8852d10afaeec762414ab05c0e",
"main.dart.js": "52181a9fbcdd60cd3daa1572ca174c7e",
"manifest.json": "5b18c3a42cf8908095635d0f1335c317",
"version.json": "5f866162cc081134c2162ddc825f6850"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
