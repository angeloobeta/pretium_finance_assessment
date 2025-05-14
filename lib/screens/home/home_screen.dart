import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/services/auth_service.dart';
import 'package:pretium_finance_assessment/utils/app_state.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    final user = appState.currentUser;
    final authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF0F7269),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
              appState.updateUser(null);

              if (context.mounted) {
                navigationService.navigateToAndClearStack(Routes.login);
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 80,
              color: Colors.teal[700],
            ),
            const SizedBox(height: 24),
            Text(
              'Welcome, ${user?.name ?? "User"}!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'You are signed in as ${user?.email ?? ""}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Your authentication flow is complete! This is where you would build the main app features.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
