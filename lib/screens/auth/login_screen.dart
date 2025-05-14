import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/services/auth_service.dart';
import 'package:pretium_finance_assessment/utils/app_state.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';
import 'package:pretium_finance_assessment/widgets/custom_button.dart';
import 'package:pretium_finance_assessment/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _rememberMe = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        final user = await _authService.login(
          _emailController.text,
          _passwordController.text,
        );

        if (mounted) {
          if (user != null) {
            // Update app state
            final appState = AppState.of(context);
            appState.updateUser(user);
            navigationService.navigateToAndClearStack(Routes.home);
          } else {
            setState(() {
              _errorMessage = 'Invalid credentials';
            });
          }
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _errorMessage = e.toString();
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
  }

  void _navigateToForgotPassword() {
    navigationService.navigateTo(Routes.forgotPassword);
  }

  void _navigateToRegister() {
    navigationService.navigateTo(Routes.register);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // App Logo
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.account_balance_wallet,
                    size: 40,
                    color: Colors.teal[700],
                  ),
                ),
                const SizedBox(height: 24),
                // Welcome Text
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),

                // Email Field
                CustomTextField(
                  label: '',
                  hintText: 'Email',
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
                const SizedBox(height: 20),

                // Password Field
                CustomTextField(
                  label: '',
                  hintText: 'Password',
                  controller: _passwordController,
                  isPassword: true,
                  prefixIcon: Icon(Icons.lock_outline, color: Colors.teal[700]),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Remember Me & Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: _rememberMe,
                            activeColor: Colors.teal[700],
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Remember me',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => _navigateToForgotPassword(),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.teal[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Error Message
                if (_errorMessage != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red[800]),
                      textAlign: TextAlign.center,
                    ),
                  ),

                // Login Button
                CustomButton(
                  text: 'Login',
                  onPressed: _login,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 24),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () => _navigateToRegister(),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.teal[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
