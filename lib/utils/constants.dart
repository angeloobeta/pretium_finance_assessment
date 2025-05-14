
import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF0F7269);
  static const Color primaryLight = Color(0xFFE5F2F1);
  static const Color primaryDark = Color(0xFF0A544E);

  // Support colors
  static const Color background = Colors.white;
  static const Color backgroundGrey = Color(0xFFF5F5F5);
  static const Color textDark = Color(0xFF333333);
  static const Color textGrey = Color(0xFF888888);
  static const Color divider = Color(0xFFEEEEEE);

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textGrey,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

class AppSizes {
  static const double borderRadius = 8.0;
  static const double borderRadiusLarge = 16.0;
  static const double padding = 16.0;
  static const double paddingSmall = 8.0;
  static const double paddingLarge = 24.0;
  static const double iconSize = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double buttonHeight = 56.0;
}

class AppStrings {
  // App
  static const String appName = 'Crypto Payments';

  // Auth
  static const String login = 'Login';
  static const String register = 'Sign Up';
  static const String forgotPassword = 'Forgot Password?';
  static const String resetPassword = 'Reset Password';
  static const String verifyAccount = 'Verify Account';
  static const String createPin = 'Create PIN';

  // Onboarding
  static const String skip = 'Skip';
  static const String next = 'Next';
  static const String getStarted = 'Get Started';

  // General
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';
  static const String save = 'Save';
  static const String success = 'Success';
  static const String error = 'Error';
  static const String loading = 'Loading...';
}

class AppAssets {
  // logo = 'assets/images/logo.png';
}
