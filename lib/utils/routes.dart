import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/screens/auth/create_pin_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/forgot_password_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/login_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/register_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/reset_password_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/verify_account_screen.dart';
import 'package:pretium_finance_assessment/screens/home/home_screen.dart';
import 'package:pretium_finance_assessment/screens/home/notifications_screen.dart';
import 'package:pretium_finance_assessment/screens/onboarding/onboarding_screen.dart';
import 'package:pretium_finance_assessment/screens/profile/profile_screen.dart';
import 'package:pretium_finance_assessment/screens/splash_screen.dart';
import 'package:pretium_finance_assessment/screens/wallet/address_screen.dart';
import 'package:pretium_finance_assessment/screens/wallet/assets_screen.dart';
import 'package:pretium_finance_assessment/screens/wallet/enter_wallet_address_screen.dart';
import 'package:pretium_finance_assessment/screens/wallet/transactions_screen.dart';
import 'package:pretium_finance_assessment/screens/wallet/wallet_address_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String verifyAccount = '/verify-account';
  static const String createPin = '/create-pin';
  static const String home = '/home';
  static const String notifications = '/notifications';
  static const String wallet = '/wallet';
  static const String deposit = '/deposit';
  static const String withdraw = '/withdraw';
  static const String transactions = '/transactions';
  static const String address = '/address';
  static const String profile = '/profile';
  static const String assets = '/assets';
  static const String walletAddress = '/wallet-address';
  static const String enterWalletAddress = '/enter-wallet-address';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case resetPassword:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => ResetPasswordScreen(
            email: args?['email'] ?? '',
          ),
        );
      case verifyAccount:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => VerifyAccountScreen(
            email: args?['email'] ?? '',
          ),
        );
      case createPin:
        return MaterialPageRoute(builder: (_) => const CreatePinScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case address:
        return MaterialPageRoute(builder: (_) => const AddressScreen());
      case transactions:
        return MaterialPageRoute(builder: (_) => const TransactionsScreen());

      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case assets:
        return MaterialPageRoute(builder: (_) => const AssetsScreen());
      case walletAddress:
        return MaterialPageRoute(builder: (_) => const WalletAddressScreen());
      case enterWalletAddress:
        return MaterialPageRoute(
            builder: (_) => const EnterWalletAddressScreen());
      // Add the rest of your routes here
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
