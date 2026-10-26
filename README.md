# CHEF'S SECRET 🍳

A Flutter-based recipe discovery app for exploring recipes, viewing ingredient and nutrition details, searching for dishes, and saving favourites locally.

**Owner & Author:** Varshitha Ruttala  
**Repository:** [varshitharuttala3/chefs_secret_varshitha](https://github.com/varshitharuttala3/chefs_secret_varshitha)

---

## Contents

- [Overview](#overview)
- [Features](#features)
- [App workflow](#app-workflow)
- [Technology stack](#technology-stack)
- [Project structure](#project-structure)
- [Requirements](#requirements)
- [Run locally with Flutter](#run-locally-with-flutter)
- [Run from Android Studio](#run-from-android-studio)
- [Build and install an APK with GitHub Actions](#build-and-install-an-apk-with-github-actions)
- [Build with Codemagic](#build-with-codemagic)
- [API configuration and security](#api-configuration-and-security)
- [Troubleshooting](#troubleshooting)
- [License and attribution](#license-and-attribution)

## Overview

Chef's Secret is a recipe application built with Flutter and Dart. It uses the Spoonacular Food API for recipe data and Dio for HTTP requests. Flutter BLoC/Cubit is used for state management, while Hive provides local storage for saved favourites.

The project includes an Android build workflow so a release APK can be generated in GitHub Actions without requiring a local Android build machine.

## Features

- **Recipe discovery:** explore recipes provided by Spoonacular.
- **Recipe search:** search for dishes, including autocomplete support where provided by the app/API.
- **Recipe details:** view recipe information, ingredients, and nutritional details when returned by the API.
- **Related recipes:** discover similar or related dishes.
- **Favourites:** bookmark recipes and store them locally with Hive.
- **Random discovery:** find a recipe when you want inspiration.
- **Sharing and links:** dependencies are included for sharing and opening links from the app.
- **Custom UI:** Flutter UI with custom Satoshi and Telma font assets.
- **Android release build:** build a release APK using GitHub Actions or Codemagic.

> Recipe availability, nutrition fields, and related-recipe results depend on the Spoonacular API response and the app's configured API access.

## App workflow

1. **Launch:** Flutter starts the app and displays its recipe-discovery interface.
2. **Discover or search:** browse recipes or search for a dish.
3. **Fetch data:** the app makes HTTP requests through Dio to the configured Spoonacular API.
4. **Explore a recipe:** open a result to view available recipe, ingredient, nutrition, and related-recipe information.
5. **Save favourites:** bookmark a recipe; Hive stores saved data locally on the device.
6. **Return later:** saved favourites can be accessed again from local storage without treating them as a server-side account feature.

At a high level:

`User → Flutter UI → BLoC/Cubit → Dio/API request → Spoonacular → Recipe results`

`Favourites UI → Hive local storage → Saved favourites`

## Technology stack

| Area | Technology |
|---|---|
| Application framework | Flutter |
| Language | Dart |
| State management | flutter_bloc (BLoC/Cubit) |
| HTTP networking | Dio |
| Recipe data | Spoonacular Food API |
| Local persistence | Hive / hive_flutter |
| UI icons | Material Icons, Cupertino Icons |
| Image caching | cached_network_image |
| HTML rendering | flutter_html |
| Navigation / external links | url_launcher |
| Sharing | share |
| Android CI build | GitHub Actions |
| Alternative build service | Codemagic |
| CI runner | Ubuntu for GitHub Actions |
| CI Java version | Temurin Java 11 |
| CI Flutter version | Flutter 2.10.5 stable |

The dependency versions in `pubspec.yaml` are from an older Flutter/Dart generation. Use the project's configured versions first; upgrading Flutter or packages may require code and Android Gradle changes.

## Project structure

Important files and folders:

- `lib/` — Dart application code, screens, state management, and API integration.
- `lib/api/` — API-related code, including the current API-key configuration file.
- `android/` — Android project, Gradle configuration, and app manifest.
- `fonts/` — bundled custom font files.
- `test/` — Flutter tests, if present.
- `.github/workflows/build-apk.yml` — GitHub Actions workflow for building a release APK.
- `codemagic.yaml` — optional Codemagic Android release workflow.
- `pubspec.yaml` — Flutter package metadata and dependencies.
- `pubspec.lock` — resolved package versions, when committed.

## Requirements

For local development, install:

1. **Git** — to clone the repository.
2. **Flutter SDK** compatible with this project's older dependencies (the CI workflow uses Flutter 2.10.5 stable).
3. **Dart SDK** supplied with the selected Flutter SDK.
4. **Android Studio** with Android SDK, Platform Tools, and an Android emulator or USB-connected Android phone.
5. **A Spoonacular API key** for recipe requests.

Verify the tools in PowerShell, Command Prompt, or a terminal:

```bash
git --version
flutter --version
flutter doctor
flutter devices
```

Resolve any Android SDK licence or toolchain issues reported by `flutter doctor` before building.

## Run locally with Flutter

Clone the target repository:

```bash
git clone https://github.com/varshitharuttala3/chefs_secret_varshitha.git
cd chefs_secret_varshitha
```

Fetch dependencies:

```bash
flutter pub get
```

Connect an Android device with USB debugging enabled or start an emulator, then run:

```bash
flutter devices
flutter run
```

To build a release APK locally:

```bash
flutter build apk --release
```

The standard output path is:

```text
build/app/outputs/flutter-apk/app-release.apk
```

### Install a locally built APK

**Option A — Android Studio:** open the project folder in Android Studio, allow Gradle/Flutter setup to finish, select an emulator or connected device, and press **Run**. To install a release APK, use **Build > Flutter > Build APK** if available in your Flutter plugin setup, or run `flutter build apk --release` in the terminal and install the generated APK.

**Option B — ADB:** with Android Platform Tools installed and a device connected, run:

```bash
adb devices
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

If you transfer the APK to the phone manually, Android may ask you to allow installation from that file manager. Only install APKs from a source you trust.

## Build and install an APK with GitHub Actions

The workflow is located at [`.github/workflows/build-apk.yml`](.github/workflows/build-apk.yml).

### What the workflow does

1. Starts on a push to `main` or when manually triggered.
2. Checks out the repository.
3. Sets up Temurin Java 11.
4. Installs Flutter 2.10.5 on the stable channel.
5. Runs `flutter pub get`.
6. Runs `flutter build apk --release`.
7. Uploads `build/app/outputs/flutter-apk/app-release.apk` as an artifact named `chefs-secret-release-apk`.

### Trigger a build manually

1. Open the [Actions tab](https://github.com/varshitharuttala3/chefs_secret_varshitha/actions).
2. Select **Build Android APK**.
3. Click **Run workflow**, choose the `main` branch, and run it.
4. Open the newly created workflow run and wait for it to finish successfully.
5. In the run's **Artifacts** section, download **chefs-secret-release-apk**. It downloads as a ZIP; extract it to get `app-release.apk`.

A push to `main` also triggers the workflow automatically.

### Install the GitHub Actions APK on an Android phone

**Option 1 — USB / ADB**

1. Download and extract the workflow artifact on your computer.
2. Enable Developer options and USB debugging on your Android phone, then connect it by USB.
3. From the folder containing `app-release.apk`, run:

```bash
adb install -r app-release.apk
```

**Option 2 — Transfer the APK to the phone**

1. Download the artifact ZIP and extract `app-release.apk).
2. Transfer the APK to your phone using USB, cloud storage, or another trusted method.
3. Open the APK on the phone and approve the installation prompt if Android requests it.

If Android reports that the app cannot be installed, check whether a different app with the same application ID is already installed and signed with a different key. Uninstalling the existing app may remove its local data.

## Build with Codemagic

The repository also includes `codemagic.yaml` for a Codemagic Android release build.

1. Sign in to Codemagic and connect the `varshitharuttala3/chefs_secret_varshitha` repository.
2. Configure the workflow to use the repository's `codemagic.yaml`.
3. Add the required Spoonacular API-key environment variable / variable group securely in Codemagic.
4. Start a build and download the APK from the build's artifacts when it succeeds.

The checked-in configuration requests Flutter 2.10.5 and uses the `recipe_secrets` environment group. Configure that group and its required variables in Codemagic before running the build. Build notifications are configured for `varshitharuttala3@gmail.com`.

## API configuration and security

The project currently contains an API-key configuration file under `lib/api/`. **Because this repository is public, any key committed directly into source code should be considered exposed.** Restrict or rotate the key in the provider dashboard if needed, and review the provider's usage limits.

For CI, the GitHub Actions workflow supports a repository secret named `SPOONACULAR_API_KEY` and passes it as a Dart compile-time define when it is set. To rely on that secret, the app's API configuration code must read the same compile-time variable (for example, with `String.fromEnvironment`) rather than always using a hard-coded key.

To configure the GitHub Actions secret:

1. Open the repository's **Settings**.
2. Go to **Secrets and variables → Actions**.
3. Select **New repository secret**.
4. Set the name to `SPOONACULAR_API_KEY` and the value to your API key.

Do not put API keys in README files, screenshots, issue reports, or public commits. A client-side mobile app cannot make a key completely secret from someone who controls the device; apply provider-side restrictions and usage limits where available.

## Troubleshooting

- **Dependency resolution fails:** use the Flutter version expected by the project first. Newer Flutter versions may be incompatible with older packages.
- **Android SDK / licences missing:** open Android Studio's SDK Manager and install the Android SDK and Platform Tools, then run `flutter doctor --android-licenses`.
- **No device detected:** run `flutter devices`; start an emulator or enable USB debugging on the phone.
- **GitHub Actions fails at dependency or Gradle steps:** open the failed workflow run and inspect the first failing step. Old Flutter projects may need Android Gradle Plugin, Gradle wrapper, or Java compatibility fixes if the build environment changes.
- **Recipes do not load:** check network access, API key configuration, provider quota, and the API response in the device logs.
- **APK artifact is missing:** confirm the build job succeeded and that the output path matches `build/app/outputs/flutter-apk/app-release.apk`.

## License and attribution

This README documents the repository's current implementation and build setup. Check the source repository and dependency licences before redistribution. Flutter, Spoonacular, and third-party package names and services remain the property of their respective owners.
