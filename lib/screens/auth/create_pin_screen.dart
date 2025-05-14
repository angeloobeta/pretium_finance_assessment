import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/services/auth_service.dart';
import 'package:pretium_finance_assessment/utils/app_state.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final List<int?> _pin = List.filled(4, null);
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _onKeyPressed(dynamic key) {
    if (key == '⌫') {
      // Backspace
      for (int i = _pin.length - 1; i >= 0; i--) {
        if (_pin[i] != null) {
          setState(() {
            _pin[i] = null;
          });
          break;
        }
      }
    } else if (key is int) {
      // Number key
      for (int i = 0; i < _pin.length; i++) {
        if (_pin[i] == null) {
          setState(() {
            _pin[i] = key;
          });

          // Check if PIN is complete
          if (!_pin.contains(null)) {
            _verifyPin();
          }
          break;
        }
      }
    }
  }

  void _verifyPin() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Future.delayed(const Duration(seconds: 1));

      // Dummy user for demonstration
      final user = await _authService.register(
        'angelo',
        'obeta',
        'angeloobeta@gmail.com',
      );

      if (mounted) {
        // Update app state with the user
        final appState = AppState.of(context);
        appState.updateUser(user);
        navigationService.navigateToAndClearStack(Routes.home);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );

        // Reset PIN on error
        setState(() {
          for (int i = 0; i < _pin.length; i++) {
            _pin[i] = null;
          }
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F7269),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),

            // Lock Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lock,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 32),

            // Create PIN Title
            const Text(
              'Create a 4-digit PIN',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // PIN Description
            const Text(
              'Your PIN will be required to access the app',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // PIN Circles
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _pin[index] != null
                        ? Colors.white
                        : Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            ),

            const Spacer(flex: 1),

            // Number Pad
            _buildNumberPad(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3].map((number) => _buildNumberKey(number)).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [4, 5, 6].map((number) => _buildNumberKey(number)).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [7, 8, 9].map((number) => _buildNumberKey(number)).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildEmptyKey(),
            _buildNumberKey(0),
            _buildBackspaceKey(),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberKey(int number) {
    return GestureDetector(
      onTap: _isLoading ? null : () => _onKeyPressed(number),
      child: Container(
        width: 70,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Center(
          child: Text(
            '$number',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyKey() {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }

  Widget _buildBackspaceKey() {
    return GestureDetector(
      onTap: _isLoading ? null : () => _onKeyPressed('⌫'),
      child: Container(
        width: 70,
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(35),
        ),
        child: const Center(
          child: Icon(
            Icons.backspace_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
