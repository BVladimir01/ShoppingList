# ShoppingList App

## Overview
An app for listing your purchases and tracking them

## Features
- Create lists
- Track purchases
- Dark theme support

## Tech Stack
- **Language:** Swift
- **Architecture:** MVVM + Router
- **Frameworks:** SwiftUI, SwiftData
- **Tools:** SwiftLint

## Installation
```bash
git clone https://github.com/BVladimir01/ShoppingList
cd ShoppingList
open ShoppingList27.xcodeproj
```

### Requirements
- Swift 5.x
- iOS 17+
- Xcode 16+

## Preview

|Manage Lists       |Manage Products          |
|:-----------------:|:-----------------------:|
|![Lists][lists_gif]|![Products][products_gif]|

##  Project Structure

**iOS-FakeNFT-Extended/** \
├ **App/** *Top level app files* \
├ **Extensions/** *Extensions for base frameworks* \
├ **Models/** *Global models* \
├ **Resources/** *Images* \
├ **Screens/** *Files for each screen* \
├ **Services/** *Services, router* \
└ **UIElements/** *Global UI elements*

## Future plan
- [ ] Add localization
- [ ] Add Unit tests
- [ ] Add UI tests
- [ ] Add documentation

## Acknowledgements
Big thanks to Yandex Practicum reviewers.

[lists_gif]: PreviewGIFs/Lists.gif
[products_gif]: PreviewGIFs/Products.gif 
