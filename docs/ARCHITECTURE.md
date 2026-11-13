# Architecture — IceK-Watch

Current-state map. Descriptive, not aspirational; see `docs/adr/` for why.

## Shape

```
IceK-Watch/                  iOS app — Swift 4.0, UIKit, CocoaPods
├── IceK Watch/
│   ├── AppDelegate.swift
│   ├── Controllers/
│   │   ├── HomeViewController.swift        sliders + catalogue entry
│   │   ├── AnimesViewController.swift      anime catalogue
│   │   ├── MoviesViewController.swift      movie catalogue
│   │   ├── SeriesViewController.swift      series catalogue
│   │   ├── ItemDetailsViewController.swift item detail
│   │   ├── PartViewController.swift        episode/part detail
│   │   ├── MovieViewController.swift       movie detail
│   │   ├── MediaPlayerViewController.swift streaming player
│   │   ├── DownloadViewController.swift    downloads
│   │   ├── AdsTestViewController.swift     ads test
│   │   └── ContactViewController.swift
│   ├── Services/ServicesImpl.swift         API client (Alamofire-style)
│   ├── Models/          Movie, Anime, Serie, Episode, Part, Item,
│   │                    Home, Slider
│   ├── Views/           collection cells etc.
│   ├── Assets.xcassets/ images
│   └── Info.plist
├── IceK WatchTests/       template tests
├── IceK WatchUITests/     template UI tests
├── IceK Watch.xcodeproj
├── IceK Watch.xcworkspace (Pods-integrated — open this)
└── Podfile               StartAppSDK, Google-Mobile-Ads-SDK,
                          AlamofireImage ~>3.3
```

## Flows

- **Browse:** `HomeViewController` (sliders) → catalogue VCs
  (animes/movies/series) → detail (`ItemDetails`/`Part`/`Movie`) →
  `MediaPlayerViewController` streams.
- **Data:** `ServicesImpl.swift` → PHP API (see contract below) →
  Models decoded → VCs render; AlamofireImage loads remote images.
- **Ads:** StartApp + Google Mobile Ads SDKs.

## Frontend/backend contract

External PHP API (not in repo):
`https://thephoenix-it.000webhostapp.com/IcekWatch/PHP_APIs/`

| Endpoint | Purpose |
|---|---|
| `v1/home.php` | home sliders/content |
| `v1/movies.php` (+`?pageStart=&pageEnd=`) | movie list (paginated) |
| `v1/series.php` (+`?id=`) | series list / detail |
| `v1/animes.php` (+pagination) | anime list |

Hard-coded base URL in `ServicesImpl.swift` — the backend is external
and may be offline.

## State

Client-side models; no local persistence visible.
