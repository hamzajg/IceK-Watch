# ADR 0001 — Initial architecture

Date: 2026-11-13 (baseline recorded retroactively)
Status: accepted (describes what is built)

## Context

An anime/movie browsing+streaming iOS app with a PHP backend and ads —
built as a portfolio/practice project in the Swift 4 era.

## Decisions

1. **UIKit + Swift 4, CocoaPods.** Classic iOS stack of the era.
   Rationale: period-appropriate; simpler than SwiftUI for a
   ViewController-heavy catalogue app.
2. **MVC-ish structure.** ViewControllers + Models + one
   `ServicesImpl` API client. Rationale: proportional to app size.
3. **External PHP API.** Content served from a hard-coded
   `000webhostapp.com` PHP backend — not in this repo. Rationale:
   fastest path; backend was a separate hosted project.
4. **Ads via StartApp + Google Mobile Ads; images via AlamofireImage.**
   CocoaPods. Rationale: standard monetisation + remote-image loading.
5. **Alamofire-style requests in `ServicesImpl`.** Single service
   layer for all endpoints. Rationale: keeps networking out of VCs.

## Consequences / open questions

- **Backend is external and fragile** — the hard-coded host may be
  dead; the app has no fallback.
- Swift 4.0 / iOS 11.2 is legacy — modern Xcode compatibility is a
  known cost.
- No real tests (templates only) — regressions are manual.
- Streaming uses `MediaPlayerViewController` — source/DRM handling is
  in that VC; review before changing playback.
