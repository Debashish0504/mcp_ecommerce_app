# MCP E-commerce App

A modern Flutter e-commerce application built with Clean Code Architecture, featuring a beautiful UI inspired by Figma design and powered by Riverpod for state management.

## Features

### 🏗️ Architecture
- **Clean Code Architecture (CCA)** with feature-based structure
- **Domain-Data-Presentation** layers separation
- **Dependency injection** with Riverpod providers
- **State management** with Riverpod StateNotifier

### 🎨 UI/UX
- Modern and responsive design
- Material Design 3 theming system
- Custom color schemes and typography
- Smooth navigation with GoRouter
- Beautiful animations and transitions

### 📱 Core Features
- **Authentication**: Login and SignUp with form validation
- **Home**: Featured products, categories, and brands showcase
- **Catalog**: Product browsing with filters and categories
- **Search**: Smart search with suggestions and results
- **Stores**: Store discovery and location-based features
- **Scan**: QR/Barcode scanner functionality (placeholder)
- **Profile**: User profile management and settings
- **Notifications**: Real-time notifications system
- **Brands**: Brand discovery and product browsing
- **Social**: Friends and article sharing features

### 🛠️ Technical Stack
- **Framework**: Flutter 3.10+
- **State Management**: flutter_riverpod
- **Navigation**: go_router with ShellRoute
- **Networking**: Dio HTTP client
- **Code Generation**: freezed, json_serializable
- **Architecture**: Clean Code Architecture

## Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── network/            # HTTP client and networking
│   ├── router/             # Navigation and routing
│   ├── theme/              # App theming and styles
│   ├── utils/              # Utility functions
│   └── widgets/            # Reusable widgets
└── features/               # Feature modules
    ├── auth/               # Authentication
    │   ├── domain/         # Entities and use cases
    │   ├── data/           # Models and repositories
    │   └── presentation/   # Pages and controllers
    ├── home/               # Home screen
    ├── catalog/            # Product catalog
    ├── search/             # Search functionality
    ├── stores/             # Store discovery
    ├── scan/               # QR/Barcode scanning
    ├── profile/            # User profile
    ├── notifications/      # Notifications
    ├── brands/             # Brand discovery
    └── feed/               # Social features
```

## Getting Started

### Prerequisites
- Flutter SDK (3.10.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Debashish0504/mcp_ecommerce_app.git
   cd mcp_ecommerce_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Development Setup

1. **Generate freezed models** (when you add new models):
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

2. **Run tests**:
   ```bash
   flutter test
   ```

3. **Analyze code**:
   ```bash
   flutter analyze
   ```

## Navigation Structure

The app uses GoRouter with a shell route for the main bottom navigation:

- **Bottom Navigation**: Home, Catalog, Search, Stores, Scan
- **External Pages**: Profile, Notifications, Brands, Friends, Articles
- **Authentication**: Login and SignUp flows

## State Management

The app uses Riverpod for state management with the following pattern:

```dart
// State class
class FeatureState {
  // State properties
}

// Controller
class FeatureController extends StateNotifier<FeatureState> {
  // Business logic
}

// Provider
final featureControllerProvider = StateNotifierProvider<FeatureController, FeatureState>(
  (ref) => FeatureController(),
);
```

## Theming

The app uses a custom theme system based on Material Design 3:

- **Colors**: Primary, secondary, surface, background colors
- **Typography**: Inter font family with various weights
- **Components**: Consistent styling for buttons, cards, inputs

## API Integration

The app includes a Dio HTTP client setup for API integration:

- Base URL configuration
- Request/response interceptors
- Error handling
- Authentication token management

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- UI design inspired by modern e-commerce applications
- Built with Flutter and the amazing Flutter community packages
- Clean Code Architecture principles by Robert C. Martin