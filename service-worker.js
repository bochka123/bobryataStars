/**
 * Welcome to your Workbox-powered service worker!
 *
 * You'll need to register this file in your web app and you should
 * disable HTTP caching for this file too.
 * See https://goo.gl/nhQhGp
 *
 * The rest of the code is auto-generated. Please don't update this file
 * directly; instead, make changes to your Workbox build configuration
 * and re-run your build process.
 * See https://goo.gl/2aRDsh
 */

importScripts("https://storage.googleapis.com/workbox-cdn/releases/4.3.1/workbox-sw.js");

self.addEventListener('message', (event) => {
  if (event.data && event.data.type === 'SKIP_WAITING') {
    self.skipWaiting();
  }
});

/**
 * The workboxSW.precacheAndRoute() method efficiently caches and responds to
 * requests for URLs in the manifest.
 * See https://goo.gl/S9QRab
 */
self.__precacheManifest = [
  {
    "url": "404.html",
    "revision": "97de6944331d902cffd9d4927bf16a95"
  },
  {
    "url": "assets/css/0.styles.a6327fea.css",
    "revision": "7b70a753dd812a502da215471f95b1eb"
  },
  {
    "url": "assets/img/search.83621669.svg",
    "revision": "83621669651b9a3d4bf64d1a670ad856"
  },
  {
    "url": "assets/js/10.ad781c78.js",
    "revision": "899ef58f3f92b85d021edba26afd2097"
  },
  {
    "url": "assets/js/11.32ba2003.js",
    "revision": "b012f550c9920cce59792eeb20924fd7"
  },
  {
    "url": "assets/js/12.f4d805b2.js",
    "revision": "45a0f424731485e8513dbf3f52453817"
  },
  {
    "url": "assets/js/13.b369ab95.js",
    "revision": "ff30346a2ae0704d1a7791e2ab06f152"
  },
  {
    "url": "assets/js/14.4fd45c58.js",
    "revision": "2826a1bfcbbdf9810af87b4f633a8390"
  },
  {
    "url": "assets/js/15.6d30bb57.js",
    "revision": "7cdfcf56bddd7afac44b65f160f730ae"
  },
  {
    "url": "assets/js/16.8c892280.js",
    "revision": "75e8b663e6490a15a5af50194906ef1e"
  },
  {
    "url": "assets/js/17.86c7ca8c.js",
    "revision": "94479945dcc33f8b1c5965f28ff44ec1"
  },
  {
    "url": "assets/js/18.5760ef43.js",
    "revision": "b806652efd10711aee30703b9c182981"
  },
  {
    "url": "assets/js/19.7835ae59.js",
    "revision": "374df65b9b682f8b352e4cde19517798"
  },
  {
    "url": "assets/js/2.9ca2cfef.js",
    "revision": "613eef12571b272390e4d84a5a7700fd"
  },
  {
    "url": "assets/js/20.dafc337d.js",
    "revision": "615c2b73bccdf4977c2843509b47367e"
  },
  {
    "url": "assets/js/21.cd0ccaeb.js",
    "revision": "66117b9da2eae856ac75b9799e67ca9c"
  },
  {
    "url": "assets/js/22.f79709f0.js",
    "revision": "5ea20e4cccb43d7bb4234abd327a43b5"
  },
  {
    "url": "assets/js/23.2309ed8e.js",
    "revision": "daa5faa54ee74be23d1bc98b5f5b8ef1"
  },
  {
    "url": "assets/js/24.8c23e369.js",
    "revision": "8142644c7d3f3da90031f936d4bd6d20"
  },
  {
    "url": "assets/js/26.2b7d224e.js",
    "revision": "d09140fd6d4af5d21412c1e04e0338bb"
  },
  {
    "url": "assets/js/3.4ed45971.js",
    "revision": "b16159aab039353619946e13967d38e4"
  },
  {
    "url": "assets/js/4.5d00dd71.js",
    "revision": "354b2b53903cf28623245afa41ac130d"
  },
  {
    "url": "assets/js/5.4b8fb81c.js",
    "revision": "b865b25b78848b369ebb4f7a7684bf5b"
  },
  {
    "url": "assets/js/6.19d66de0.js",
    "revision": "34e4dc8308467d77a9dc5318911ce920"
  },
  {
    "url": "assets/js/7.3906f7a7.js",
    "revision": "dbf3fe1c5b38157ad795d49e2c42bfcd"
  },
  {
    "url": "assets/js/8.e8761b22.js",
    "revision": "df02b8b825d5757e125dbe170d1555c1"
  },
  {
    "url": "assets/js/9.c0a843c2.js",
    "revision": "6fdef7e064583d735d435c9c7be58314"
  },
  {
    "url": "assets/js/app.28e780d4.js",
    "revision": "82b96ebc3e7d56345e6a2afcd0004cc2"
  },
  {
    "url": "conclusion/index.html",
    "revision": "c5e6e37ef87d1f62c90889ef449ad0f8"
  },
  {
    "url": "design/index.html",
    "revision": "8b2172402106250bf6014e169febfa3c"
  },
  {
    "url": "index.html",
    "revision": "f90568e75b8a9e10eb3eddc3d484b320"
  },
  {
    "url": "intro/index.html",
    "revision": "95b6174fa3e8dbe6610f7b21517af040"
  },
  {
    "url": "license.html",
    "revision": "70a2edbdcd1a16b29dc6ec11e14ab937"
  },
  {
    "url": "myAvatar.png",
    "revision": "b76db1e62eb8e7fca02a487eb3eac10c"
  },
  {
    "url": "requirements/index.html",
    "revision": "94351ac20b6689915456a5b4f5da2257"
  },
  {
    "url": "requirements/stakeholders-needs.html",
    "revision": "a15d86117c63c661ac8705549c1cc1a1"
  },
  {
    "url": "requirements/state-of-the-art.html",
    "revision": "034ba682c4603199c7a94bedc20a86ea"
  },
  {
    "url": "software/index.html",
    "revision": "03cc30f99b8477a01542dad424e94d56"
  },
  {
    "url": "test/index.html",
    "revision": "797d8bc9c1d35048dca78d230719100d"
  },
  {
    "url": "use cases/index.html",
    "revision": "c03d45d19c109a2a17ebe7ecf2eaf317"
  }
].concat(self.__precacheManifest || []);
workbox.precaching.precacheAndRoute(self.__precacheManifest, {});
addEventListener('message', event => {
  const replyPort = event.ports[0]
  const message = event.data
  if (replyPort && message && message.type === 'skip-waiting') {
    event.waitUntil(
      self.skipWaiting().then(
        () => replyPort.postMessage({ error: null }),
        error => replyPort.postMessage({ error })
      )
    )
  }
})
