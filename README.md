# Pretium Finance Mobile App Assessment

## Project Overview

This project is a Flutter-based cryptocurrency payment application for the Pretium Finance assessment. The app allows users to manage crypto payments, view wallet balances, and perform transactions across African countries.

## Features

### Authentication

* Onboarding flow with feature showcase
* User registration with email verification
* Login with email and password
* Password reset functionality
* PIN creation for app security

### Home & Wallet

* Dashboard with wallet balance
* Financial services integration (Opay, Moniepoint, PalmPay, etc.)
* Transaction history
* Deposit and withdrawal functionality
* QR code wallet address for receiving payments

### Profile & Settings

* User profile management
* Country selection (Kenya, Nigeria, Ghana, etc.)
* Currency settings
* Asset management (cUSD, USDT, USDC)
* Security features (PIN, logout, account deletion)

## Project Structure

```
lib/
├── main.dart                       # Application entry point
├── models/
│   ├── user.dart                   # User data model
│   └── crypto_asset.dart           # Cryptocurrency asset model
├── screens/
│   ├── splash_screen.dart          # Initial loading screen
│   ├── onboarding/
│   │   └── onboarding_screen.dart  # First-time user introduction
│   ├── auth/
│   │   ├── login_screen.dart       # User login
│   │   ├── register_screen.dart    # New user registration
│   │   ├── forgot_password_screen.dart # Password recovery - step 1
│   │   ├── reset_password_screen.dart  # Password recovery - step 2
│   │   ├── verify_account_screen.dart  # Email verification
│   │   └── create_pin_screen.dart      # Security PIN setup
│   ├── home/
│   │   ├── home_screen.dart            # Main dashboard
│   │   └── notifications_screen.dart   # User notifications
│   └── wallet/
│       ├── address_screen.dart         # Wallet QR code display
│       ├── wallet_address_screen.dart  # View wallet address
│       ├── enter_wallet_address_screen.dart # Input recipient address
│       ├── assets_screen.dart          # Crypto assets list
│       ├── deposit_screen.dart         # Add funds to wallet
│       ├── withdraw_screen.dart        # Transfer funds out
│       └── transactions_screen.dart    # Transaction history
├── services/
│   ├── auth_service.dart           # Authentication logic
│   └── storage_service.dart        # Local data persistence
├── utils/
│   ├── app_state.dart              # Global state management
│   ├── constants.dart              # App-wide constants
│   ├── navigation_service.dart     # Central navigation management
│   ├── routes.dart                 # Application routes
│   └── validators.dart             # Form input validation
└── widgets/
    ├── app_drawer.dart             # Side navigation drawer
    ├── custom_button.dart          # Reusable button component
    ├── custom_text_field.dart      # Reusable input component
    ├── custom_dialogs.dart         # Alert and confirmation dialogs
    ├── custom_bottom_nav.dart      # Bottom navigation bar
    ├── wallet_card.dart            # Wallet balance display
    ├── financial_services.dart     # Service provider options
    └── empty_state.dart            # Empty list placeholders
```

## Architecture & Design Decisions

### State Management

The application uses Flutter's built-in state management through `InheritedWidget` and `setState`, avoiding external state management libraries like Riverpod, Provider, or GetX as specified in the assessment requirements.

### Navigation

A centralized `NavigationService` implements a consistent navigation pattern throughout the app. This facilitates:

* Clean navigation calls from any part of the app
* Reduced context dependencies
* Simplified testing
* Consistent navigation animations

### UI Components

The app follows a component-based architecture with reusable widgets that maintain consistent styling throughout the application. This ensures a unified user experience and simplifies maintenance.

### Authentication Flow

A comprehensive authentication flow includes:

1. Splash screen with auth check
2. Feature-based onboarding for new users
3. Registration with email verification
4. Secure login with "Remember me" option
5. Password recovery process
6. PIN creation for security

### Mock Services

For assessment purposes, the app uses mock services that simulate API calls with `Future.delayed()`. In a production environment, these would be replaced with actual API integrations.

## Setup & Running

### Prerequisites

* Flutter SDK (latest stable version)
* Dart SDK
* Android Studio or VS Code with Flutter extensions
* Android or iOS emulator/device

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/pretium-finance-assessment.git
   ```
2. Navigate to the project directory:
   ```
   cd pretium-finance-assessment
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the app:
   ```
   flutter run
   ```

### Building for Production

To create a release build:

```
# For Android
flutter build apk --release

# For iOS
flutter build ios --release
```

## Testing Credentials

For testing the application, you can use these credentials:

* Email: `test@example.com`
* Password: `password`

## Assessment Focus Areas

This implementation focuses on the following assessment criteria:

1. **Clean Architecture** : Proper separation of concerns with services, models, and UI layers
2. **Code Quality** : Readable, maintainable code with consistent patterns
3. **UI Implementation** : Pixel-perfect implementation of the provided design mockups
4. **Navigation** : Seamless flow between screens with proper state management
5. **Form Handling** : Validation, error states, and user feedback
6. **Reusable Components** : DRY principles through shared widgets

## Future Improvements

With additional time, the following enhancements could be implemented:

* Unit and widget tests
* Integration with actual API endpoints
* Biometric authentication
* Dark mode support
* Localization for multiple languages
* Push notification handling
* Analytics integration
* Performance optimizations for large transaction histories

## Notes for Assessment Review

* The app follows all the specified requirements for the assessment
* No external state management libraries are used
* The UI closely matches the provided design mockups
* All screens have consistent navigation using the NavigationService
* The codebase prioritizes maintainability and readability

---

Submitted by [Your Name] for the Pretium Finance Flutter Developer Assessment.
