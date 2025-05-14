# Pretium Crypto Wallet App

A Flutter cryptocurrency wallet application focused on stablecoins on the Celo network. This app allows users to send, receive, and manage crypto assets across multiple African countries.

## Features

* Complete authentication flow (login, registration, email verification)
* PIN security for app access
* Crypto wallet functionality
* Support for multiple stablecoins (cUSD, USDT, USDC)
* Financial services integration for African payment providers
* QR code wallet address sharing
* Transaction history tracking
* Multi-country support with localized services
* Profile and settings management

## Project Structure

The app follows a clean, modular architecture with the following structure:

```
lib/
├── main.dart                       # Main entry point for the application
├── models/                         # Data models
│   ├── user.dart                   # User model class
│   └── crypto_asset.dart           # Cryptocurrency asset model
├── screens/                        # UI screens grouped by feature
│   ├── splash_screen.dart          # Initial loading screen
│   ├── onboarding/                 # First-time user experience
│   │   └── onboarding_screen.dart  # Onboarding flow with feature highlights
│   ├── auth/                       # Authentication screens
│   │   ├── login_screen.dart       # Login screen
│   │   ├── register_screen.dart    # Registration screen
│   │   ├── forgot_password_screen.dart # Forgot password screen
│   │   ├── reset_password_screen.dart  # Reset password with code
│   │   ├── verify_account_screen.dart  # Email verification screen
│   │   └── create_pin_screen.dart      # PIN creation screen
│   ├── home/                       # Main app screens
│   │   ├── home_screen.dart        # Main dashboard
│   │   └── notifications_screen.dart   # Notifications list
│   └── wallet/                     # Wallet functionality
│       ├── address_screen.dart         # QR code/address screen
│       ├── wallet_address_screen.dart  # View wallet address
│       ├── enter_wallet_address_screen.dart # Enter wallet address
│       ├── assets_screen.dart          # Assets list
│       ├── deposit_screen.dart         # Deposit crypto screen
│       ├── withdraw_screen.dart        # Withdraw crypto screen
│       └── transactions_screen.dart    # Transaction history
├── services/                       # Business logic services
│   ├── auth_service.dart           # Authentication service
│   └── storage_service.dart        # Local storage service
├── utils/                          # Utility functions and helpers
│   ├── app_state.dart              # Global state using InheritedWidget
│   ├── constants.dart              # App-wide constants
│   ├── navigation_service.dart     # Centralized navigation
│   ├── routes.dart                 # Route definitions
│   └── validators.dart             # Form validation logic
└── widgets/                        # Reusable UI components
    ├── app_drawer.dart             # Side drawer with profile/settings
    ├── custom_button.dart          # Reusable button component
    ├── custom_text_field.dart      # Reusable text field component
    ├── custom_dialogs.dart         # Success and error dialogs
    ├── custom_bottom_nav.dart      # Bottom navigation bar
    ├── wallet_card.dart            # Wallet balance card
    ├── financial_services.dart     # Financial services section
    └── empty_state.dart            # Empty state for lists
```

## State Management Approach

The app uses Flutter's built-in state management with InheritedWidget for global state, avoiding external state management libraries like Provider, Riverpod, or GetX. This approach demonstrates how to build a clean, maintainable app using just the core Flutter framework.

Key state management components:

* `app_state.dart` - InheritedWidget for app-wide state
* `navigation_service.dart` - Centralized navigation service for consistent routing
* Local state management with `setState()` for component-specific state

## Authentication Flow

The app implements a complete authentication flow:

1. Splash screen checks for existing login credentials
2. Onboarding screens for first-time users
3. Login/Registration screens with form validation
4. Email verification with country selection
5. Password reset functionality
6. PIN creation for app security

## Wallet Functions

The wallet functionality includes:

* Viewing wallet balances across multiple cryptocurrencies
* Depositing crypto to wallet via QR code
* Withdrawing crypto to external wallets
* Viewing transaction history
* Access to wallet address for receiving funds
* Support for Celo network stablecoins (cUSD, USDT, USDC)

## Financial Services

The app integrates with several African financial service providers:

* Opay
* Moniepoint
* PalmPay
* Airtime purchases

These services are localized based on the user's selected country.

## Settings and Profile

User settings and profile management are accessible through the app drawer, including:

* Currency selection
* Asset management
* Wallet address access
* Support and documentation
* App version information
* Account management (sign out, delete account)

## Installation and Setup

### Prerequisites

* Flutter SDK 3.0.0 or higher
* Dart SDK 2.17.0 or higher
* Android Studio or VS Code with Flutter extensions

### Getting Started

1. Clone the repository:

```bash
git clone https://github.com/yourusername/pretium-crypto-app.git
cd pretium-crypto-app
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## Environment Configuration

The app is pre-configured to use mock services for demonstration purposes. In a production environment, you would need to:

1. Configure API endpoints for authentication and wallet services
2. Set up secure storage for sensitive information
3. Implement real API calls instead of simulated delays

## Mock Data

For demonstration purposes, the app uses simulated data:

* Cryptocurrencies with zero balances
* Mock transaction history
* Sample financial services
* Demo user accounts

## Future Enhancements

Planned future enhancements include:

* Biometric authentication
* Push notifications
* Transaction analytics and reports
* Multi-language support
* Dark mode theme
* Additional payment integrations

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

* Flutter team for the excellent framework
* Celo for blockchain infrastructure
* All the African payment providers integrated in this app

## Contact

For any inquiries, please contact angeloobeta@hotmail[.com](mailto:your-email@example.com)
