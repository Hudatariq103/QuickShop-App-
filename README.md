# QuickShop – Organized Flutter Project

The interface, product images, colour scheme and assignment features are kept the same.
The Dart code is now separated into files by responsibility.

## Run in VS Code

If this is the first time running the project on Chrome, run:

```powershell
flutter create . --platforms=web,android
flutter pub get
flutter run -d chrome
```

For Android, start an emulator or connect a phone:

```powershell
flutter pub get
flutter run
```

## Project structure

```text
lib/
  main.dart
  app.dart
  models/
    product.dart
  theme/
    app_theme.dart
  screens/
    splash_screen.dart
    home_screen.dart
    product_details_screen.dart
    add_product_screen.dart
    gesture_animation_screen.dart
    web_view_screen.dart
  widgets/
    product_card.dart
assets/
  products/
    headphones.jpg
    watch.jpg
    shoes.jpg
    backpack.jpg
    camera.jpg
    mug.jpg
```

## WebView note

The actual `webview_flutter` screen is initialized on Android. Chrome displays a helpful message because `webview_flutter` does not provide a browser WebView implementation. The WebView drawer option remains available on both platforms.

## Assignment features

- Splash screen and automatic navigation
- Home screen and Navigation Drawer
- Product catalogue with search and category filter
- Product details and Add to Cart
- Add Product form with validation
- Five gestures
- Animated widget
- Counter with `setState()`
- WebView screen (actual embedded website on Android)
