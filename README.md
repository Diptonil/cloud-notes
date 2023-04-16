# Example Apps for Flutter

This repository contains simple demo apps for learning the intricacies of the framework, with each type of app properly documented along with the prime lesson learnt with it.


## Flutter

It is a UI framework developed by Google built for cross-platform apps that are highly performant.


## Dart

The `dart` directory documents some starters about the language that can be used to operate the framework well.


## Developer Accounts

In the initial stages of development, the need for these accounts won't seem apparent. But it is good practice to start with them, if possible financially.
- The Google Play Developer account is what gives you the ability to make your app available on the Play Store for Android users.
- An Apple Developer Account enables users to publish and manage iOS apps on the Apple App Store.
- There are two types: Individual and Organizational.
- Whatever the case is, this step is always paid.


## General Project Structure

We always would see certain folders and files get generated when we do a `flutter create`. Some are:
- `ios`: Binaries for running app on iOS.
- `android`: Binaries for running app on Android.
- `web`: Files for running app on web.
- `linux`: Binaries for running app on Linux OS.
- `windows`: Binaries for running app on Windows OS.
- `analysis_options.yaml`: An analyser that sets code standards and enforces them through the use of the IDE. It has linter configurations and rules.
- `pubspec.yaml`: Records dependencies and makes links with objects and files that would get used in the project externally. A configuration file like `settings.py` in Django.


## Apps

1. **Abstraction** (*first_app*): A lesson in making the first Flutter app.
    - Just uses `StatelessWidgets` (no state of the app to be saved).
    - Minimal and the least bit of code.
    - Deals mostly with the starter concepts of reloads, widget trees, state, etc.
1. **My Notes** (*mynotes*): A lesson in making an entire Notes mobile app (just for Android and iOS) from scratch till deployment.
    - Uses standard Flutter commands for every operation. Commands are listed in `flutter-commands.md`.
