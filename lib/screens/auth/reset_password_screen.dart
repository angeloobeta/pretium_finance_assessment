import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';
import 'package:pretium_finance_assessment/widgets/custom_button.dart';
import 'package:pretium_finance_assessment/widgets/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;

  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _resetCodeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  void _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Simulate API call
        await Future.delayed(const Duration(seconds: 1));

        if (mounted) {
          // Show success message and navigate to login screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset successfully'),
              backgroundColor: Colors.green,
            ),
          );
          navigationService.navigateToAndClearStack(Routes.login);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.toString()}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  void dispose() {
    _resetCodeController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => navigationService.goBack(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Enter the code sent to your email and set a new password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),

                // Reset Code Field
                CustomTextField(
                  label: 'Reset Code',
                  controller: _resetCodeController,
                  keyboardType: TextInputType.number,
                  prefixIcon: Icon(Icons.lock_reset, color: Colors.teal[700]),
                  hintText: 'Enter 4-digit reset code',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the reset code';
                    }
                    if (value.length != 4 || int.tryParse(value) == null) {
                      return 'Please enter a valid 4-digit code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // New Password Field
                CustomTextField(
                  label: 'New Password',
                  controller: _newPasswordController,
                  isPassword: true,
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.teal[700]),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Confirm Password Field
                CustomTextField(
                  label: 'Confirm Password',
                  controller: _confirmPasswordController,
                  isPassword: true,
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.teal[700]),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),

                // Reset Password Button
                CustomButton(
                  text: 'Reset Password',
                  onPressed: _resetPassword,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
