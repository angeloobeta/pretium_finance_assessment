import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';
import 'package:pretium_finance_assessment/widgets/custom_button.dart';
import 'package:pretium_finance_assessment/widgets/custom_dialogs.dart';
import 'package:pretium_finance_assessment/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _sendResetCode() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Simulate API call
        await Future.delayed(const Duration(seconds: 1));

        if (mounted) {
          // Show success dialog
          CustomDialogs.showSuccessDialog(
            context: context,
            title: 'Reset Code Sent',
            message:
                'We have sent a password reset code to ${_emailController.text}',
            buttonText: 'Continue',
            onPressed: () {
              Navigator.pop(context);
              navigationService.navigateTo(
                Routes.resetPassword,
                arguments: {'email': _emailController.text},
              );
            },
          );
        }
      } catch (e) {
        if (mounted) {
          // Show error dialog
          CustomDialogs.showErrorDialog(
            context: context,
            title: 'Error',
            message: 'Exception: The selected email is invalid.',
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
    _emailController.dispose();
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Enter your email to receive a password reset code',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),

                // Email Field
                CustomTextField(
                  label: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon:
                      Icon(Icons.email_outlined, color: Colors.teal[700]),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),

                // Send Reset Code Button
                CustomButton(
                  text: 'Send Reset Code',
                  onPressed: _sendResetCode,
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
