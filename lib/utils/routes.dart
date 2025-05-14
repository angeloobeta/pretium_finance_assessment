import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/screens/auth/create_pin_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/forgot_password_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/login_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/register_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/reset_password_screen.dart';
import 'package:pretium_finance_assessment/screens/auth/verify_account_screen.dart';
import 'package:pretium_finance_assessment/screens/home/home_screen.dart';
import 'package:pretium_finance_assessment/screens/onboarding/onboarding_screen.dart';
import 'package:pretium_finance_assessment/screens/splash_screen.dart';

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
