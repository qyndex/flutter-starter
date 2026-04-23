# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter Starter — Material 3 Flutter starter app with bottom navigation, GoRouter routing, and Riverpod state management across 3 screens.

Built with Flutter 3.x and Dart.

## Commands

```bash
flutter pub get          # Install dependencies
flutter run              # Run on connected device/emulator
flutter test             # Run tests
flutter analyze          # Static analysis
dart format .            # Format code
flutter build apk        # Build Android APK
flutter build ios        # Build iOS (macOS only)
flutter build web        # Build web version
```

## Architecture

- `lib/` — Application source code
- `lib/main.dart` — Entry point
- `lib/screens/` or `lib/pages/` — Screen widgets
- `lib/widgets/` — Reusable widgets
- `lib/models/` — Data models
- `lib/services/` — API clients and business logic
- `test/` — Test files

## Rules

- Use `StatelessWidget` unless state is needed
- Provider or Riverpod for state management
- All widgets should be const-constructible where possible
- Follow effective Dart style guide
- Separate business logic from UI widgets
