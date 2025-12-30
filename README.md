# Project Documentation  [简体中文](README.zh-CN)

#### Web Preview: https://robincarrollallen.github.io/flutter-app

## Technology Stack Overview

This project is a high-performance cross-platform mobile application developed with **Flutter [Version]**, supporting **iOS** and **Android** native deployment from a single codebase. The project adopts a clean architecture (MVVM/Bloc/Riverpod) with complete multilingual, multi-theme, state management, and data persistence capabilities, suitable for [Describe your app scenario, e.g., E-commerce, Social, Finance].

### 1. Environment & Tools

- **Flutter SDK**: [e.g., ^3.19.0]
- **Dart SDK**: [e.g., ^3.3.0]
- **IDE**: VS Code / Android Studio

### Core Features

- 🚀 **Cross-platform**: Unified codebase for iOS + Android (and potentially Web/Desktop)
- 🎨 **Theme System**: Supports Light/Dark modes and custom color schemes
- 🌍 **Internationalization**: [Number] languages supported via `flutter_localizations`
- 💾 **Persistence**: Secure storage + Local Database (Hive/Isar/Sqflite)
- 📱 **UI/UX**: Material Design 3 / Cupertino styling adaptive to platform
- 🔐 **Security**: Secure storage for tokens, SSL pinning
- ⚡ **Performance**: 60/120 FPS performance with impeller rendering engine

### 2. Core Libraries

| Package | Version | Purpose |
|---------|---------|---------|
| **flutter_bloc** / **riverpod** | ^[x.x.x] | State Management |
| **dio** / **http** | ^[x.x.x] | Network Requests |
| **go_router** / **auto_route** | ^[x.x.x] | Routing & Navigation |
| **get_it** | ^[x.x.x] | Dependency Injection |

### 3. UI & Assets

| Package | Version | Purpose |
|---------|---------|---------|
| **flutter_svg** | ^[x.x.x] | SVG rendering |
| **google_fonts** | ^[x.x.x] | Custom typography |
| **cached_network_image** | ^[x.x.x] | Image caching |
| **lottie** | ^[x.x.x] | Complex animations |

### 4. Utility Libraries

| Package | Version | Purpose |
|---------|---------|---------|
| **intl** | ^[x.x.x] | Internationalization & Formatting |
| **logger** | ^[x.x.x] | Pretty console logging |
| **json_annotation** | ^[x.x.x] | JSON Serialization |
| **equatable** | ^[x.x.x] | Value equality comparison |

## Directory Structure & Usage

The project follows a feature-first / clean architecture approach: