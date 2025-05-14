// screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/services/auth_service.dart';
import 'package:pretium_finance_assessment/utils/app_state.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 2)); // Splash screen delay

    if (mounted) {
      try {
        // Try to auto-login with saved credentials
        final user = await _authService.autoLogin();

        if (mounted) {
          if (user != null) {
            // Update app state
            final appState = AppState.of(context);
            appState.updateUser(user);

            // Navigate to home
            navigationService.navigateToAndClearStack(Routes.home);
          } else {
            // No saved credentials, show onboarding
            navigationService.navigateToAndClearStack(Routes.onboarding);
          }
        }
      } catch (e) {
        // Error during auto-login, show onboarding
        if (mounted) {
          navigationService.navigateToAndClearStack(Routes.onboarding);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F7269),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.account_balance_wallet,
                size: 60,
                color: Color(0xFF0F7269),
              ),
            ),
            const SizedBox(height: 32),

            // App Name
            const Text(
              'Pretium',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // Loading Indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
