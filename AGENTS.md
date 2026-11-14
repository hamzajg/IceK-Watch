# AGENTS.md — IceK-Watch

Guidance for AI agents (and humans) working in this repository.

## Project

An iOS app (`com.hamzajg.IceK-Watch`) for browsing and watching anime and
movies: home sliders, catalogue of series/movies, episode/part detail
screens, streaming, ads. Swift 4.0, UIKit, CocoaPods.
Ads: StartApp + Google Mobile Ads. Images: AlamofireImage.

## Commands

**No CI.** Xcode project — builds need macOS + Xcode + CocoaPods.

| Task | Command |
|---|---|
| Install deps | `pod install` (Podfile: StartAppSDK, Google-Mobile-Ads-SDK, AlamofireImage ~>3.3) |
| Build | open `IceK Watch.xcodeproj` in Xcode, build/run |
| Test | Xcode test action (template `IceK_WatchTests`/`UITests` only) |

Requires: Xcode + iOS SDK + CocoaPods; deployment target iOS 11.2,
Swift 4.0. `IceK Watch.xcworkspace` is the Pods-integrated workspace —
open it, not the bare `.xcodeproj`, after `pod install`.

## Architecture

```
IceK Watch/
  AppDelegate.swift          app delegate
  Controllers/
    HomeViewController.swift     sliders + catalogue entry
    AnimesViewController.swift   anime list
    MoviesViewController.swift   movie list
    SeriesViewController.swift   series list
    ItemDetailsViewController.swift
    PartViewController.swift     episode/part detail
    MovieViewController.swift    movie detail
    MediaPlayerViewController.swift  streaming player
    DownloadViewController.swift    downloads
    AdsTestViewController.swift    ads test
    ContactViewController.swift
  Services/ServicesImpl.swift    API client (Alamofire-style requests)
  Models/                       Movie, Anime, Serie, Episode, Part,
                                Item, Home, Slider
  Views/                        collection cells etc.
  Assets.xcassets/              images
IceK WatchTests/  IceK WatchUITests/   template tests
Podfile / Podfile.lock?         pods: StartAppSDK, Google-Mobile-Ads-SDK,
                                AlamofireImage
```

### Backend contract (external PHP API)

`ServicesImpl.swift` hits `https://thephoenix-it.000webhostapp.com/
IcekWatch/PHP_APIs/` — endpoints `v1/home.php`, `v1/movies.php`
(+`?pageStart=&pageEnd=` pagination), `v1/series.php` (+`?id=`),
`v1/animes.php`, etc. **The backend is not in this repo** — treat the
PHP API as external; URL is hard-coded in `ServicesImpl.swift`.

## Conventions

- UIKit + storyboards/xibs era Swift 4 — ViewControllers + Models +
  a single `ServicesImpl` API layer.
- AlamofireImage for remote images; Alamofire-style requests in
  `ServicesImpl`.
- Ads via StartApp + Google Mobile Ads SDKs (Pods).
- Keep the existing MVC-ish structure — no SwiftUI rewrite.

## Landmines

- **Default branch is `master`, not `main`.**
- **Swift 4.0 / iOS 11.2 deployment target** — legacy; modern Xcode may
  warn. Pods (`Podfile`) must be installed.
- Backend API is a **hard-coded 000webhostapp.com PHP host** — external,
  may be dead; don't assume it works.
- `Pods/` may or may not be committed — run `pod install` first.
- Open the **`.xcworkspace`** (not `.xcodeproj`) after pods.
- Template tests only — no real coverage.
- App streams video + shows ads — test on device/simulator with network.

## Agent rules

- Branch from `master`; name branches `feat/*`, `fix/*`, `chore/*`, `docs/*`.
- Docs-only changes still go through a PR; never commit to `master` directly.
- Verify before claiming: `pod install` + Xcode build — report honestly
  if you can't run Xcode.
- API changes must keep `ServicesImpl.swift` endpoint usage in sync —
  document the external contract in docs/ARCHITECTURE.md.
- Keep changes minimal and consistent with surrounding code. No drive-by
  refactors.
- Update AGENTS.md / docs/ARCHITECTURE.md when endpoints, pods, or
  structure change.
