# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter Starter -- Material 3 Flutter app with bottom navigation (Home, Explore, Profile), GoRouter routing, and Riverpod state management.

- **Flutter**: >=3.24.0, Dart SDK >=3.5.0
- **State management**: Riverpod (flutter_riverpod + riverpod_annotation + riverpod_generator)
- **Routing**: GoRouter with ShellRoute for persistent bottom NavigationBar
- **HTTP**: Dio with interceptors for API calls
- **Architecture**: screens/ for page-level widgets, services/ for API layer, Riverpod providers for DI

## Commands

```bash
# Dependencies
flutter pub get              # Install/update dependencies

# Run
flutter run                  # Run on connected device/emulator
flutter run -d chrome        # Run in Chrome (web)
flutter run -d macos         # Run on macOS desktop

# Testing
flutter test                 # Run all tests
flutter test test/widget_test.dart                  # Run specific test file
flutter test test/screens/                          # Run all screen tests
flutter test --coverage                             # Run tests with coverage report

# Static analysis
flutter analyze              # Dart analyzer (uses analysis_options.yaml)
dart format .                # Format all Dart files
dart format --set-exit-if-changed .                 # Format check (CI mode)

# Code generation (Riverpod generators)
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch                         # Watch mode for generators

# Build
flutter build apk            # Android APK
flutter build ios            # iOS (macOS only)
flutter build web            # Web (outputs to build/web/)
flutter build macos           # macOS desktop app
```

## Architecture

```
lib/
  main.dart              -- Entry point: ProviderScope wrapping MyApp
  app.dart               -- MyApp (ConsumerWidget), GoRouter config, ScaffoldWithNav
  screens/
    home_screen.dart     -- Welcome card + "Get Started" button
    explore_screen.dart  -- 2-column grid of 12 placeholder items
    profile_screen.dart  -- Avatar, user info, Settings/Help/Sign Out menu
  services/
    api_service.dart     -- Dio-based HTTP client with Riverpod providers
test/
  widget_test.dart       -- App-level widget tests (navigation, theme, rendering)
  screens/
    home_screen_test.dart
    explore_screen_test.dart
    profile_screen_test.dart
```

## Environment

Copy `.env.example` to `.env` and set:
- `SUPABASE_URL` -- Your Supabase project URL
- `SUPABASE_ANON_KEY` -- Your Supabase anonymous key

The `.env` file is gitignored. Never commit secrets.

## Rules

- Use `StatelessWidget` unless local mutable state is required; prefer `ConsumerWidget` when accessing Riverpod providers
- All widgets should be const-constructible where possible (`const MyWidget()`)
- Follow effective Dart style guide: `lowerCamelCase` for variables/functions, `UpperCamelCase` for types
- Separate business logic from UI -- logic lives in providers and services, not in widget build methods
- Use GoRouter for all navigation -- never `Navigator.push` directly
- Use Riverpod providers for dependency injection -- never instantiate services manually in widgets
- HTTP calls go through `ApiService` via `apiServiceProvider` -- never use raw Dio or http
- Screen widgets live in `lib/screens/`, reusable widgets in `lib/widgets/`, models in `lib/models/`
- Every new screen needs a corresponding test file in `test/screens/`
- Run `flutter analyze` before committing -- zero warnings policy
- Run `flutter test` before committing -- all tests must pass
