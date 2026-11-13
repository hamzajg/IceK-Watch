# IceK-Watch

An iOS app for browsing and watching anime and movies.

## What it does

`IceK-Watch` presents a home screen with sliders, a catalogue of series and
movies, and episode/part detail screens. It streams video and shows ads.

## Tech stack

- **Language:** Swift
- **Platform:** iOS (UIKit), CocoaPods
- **Ads:** StartApp and Google Mobile Ads
- **Images:** AlamofireImage

## Project layout

```
IceK Watch/
  Models/         # Anime, Serie, Movie, Episode, Part, Slider, Home, Item
  Controllers/    # ViewController and detail screens
  AppDelegate.swift
IceK WatchTests/
IceK WatchUITests/
IceK Watch.xcworkspace
Podfile
```

## Building

Open `IceK Watch.xcworkspace` in Xcode, or install pods first (from the
repository root — the `Podfile` and the workspace are both at the top level):

```bash
pod install
open "IceK Watch.xcworkspace"
```

Dependencies: StartAppSDK, Google-Mobile-Ads-SDK, AlamofireImage 3.x.

## Configuration

Ad network keys (StartApp and AdMob) must be configured in the project/pods
before running against a live account.

## Tests

- `IceK WatchTests` — unit tests
- `IceK WatchUITests` — UI tests

Run them from Xcode (`Product ▸ Test`) on a simulator.

## Status

Legacy iOS project using old ad SDKs and AlamofireImage 3.x. Modernizing it
would require updating the pods and iOS project settings.
