import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/widgets/custom_button.dart';
import 'create_pin_screen.dart';

class VerifyAccountScreen extends StatefulWidget {
  final String email;

  const VerifyAccountScreen({
    super.key,
    required this.email,
  });

  @override
  _VerifyAccountScreenState createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  final TextEditingController _codeController = TextEditingController();
  String _selectedCountry = '';
  bool _isLoading = false;
  String? _verificationMessage;
  bool _isVerificationSuccess = false;

  final List<String> _countries = [
    'Kenya',
    'Uganda',
    'Nigeria',
    'Ghana',
    'Malawi',
    'Zambia',
    'Rwanda',
    'Global Users [全球用户]',
  ];

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _showCountrySelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Text(
                'Select Country',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_countries[index]),
                      onTap: () {
                        setState(() {
                          _selectedCountry = _countries[index];
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _verifyAccount() async {
    if (_selectedCountry.isEmpty) {
      setState(() {
        _verificationMessage = 'Please select your country';
        _isVerificationSuccess = false;
      });
      return;
    }

    if (_codeController.text.isEmpty) {
      setState(() {
        _verificationMessage = 'Please enter the verification code';
        _isVerificationSuccess = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _verificationMessage = null;
    });

    try {
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        _isVerificationSuccess = true;
        _verificationMessage = 'Verification successful!';
      });

      await Future.delayed(const Duration(milliseconds: 800));

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const CreatePinScreen(),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isVerificationSuccess = false;
        _verificationMessage = 'Verification failed: ${e.toString()}';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _resendCode() async {
    setState(() {
      _isLoading = true;
      _verificationMessage = null;
    });

    try {
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        _verificationMessage = 'Verification code resent';
        _isVerificationSuccess = true;
      });
    } catch (e) {
      setState(() {
        _verificationMessage = 'Failed to resend code: ${e.toString()}';
        _isVerificationSuccess = false;
      });
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verify Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Enter the verification code sent to your email',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),

              // Country Selector
              GestureDetector(
                onTap: _showCountrySelector,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedCountry.isEmpty
                            ? 'Select Country'
                            : _selectedCountry,
                        style: TextStyle(
                          fontSize: 16,
                          color: _selectedCountry.isEmpty
                              ? Colors.grey.shade600
                              : Colors.black,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Verification Code Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Text(
                      '1234',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _codeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        ),
                      ),
                    ),
                    Icon(Icons.shield, color: Colors.grey[700]),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Verification Message
              if (_verificationMessage != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: _isVerificationSuccess
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _verificationMessage!,
                    style: TextStyle(
                      color: _isVerificationSuccess
                          ? Colors.green[800]
                          : Colors.red[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              const SizedBox(height: 24),

              // Verify Button
              CustomButton(
                text: 'Verify Account',
                onPressed: _verifyAccount,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 24),

              // Resend Code
              Center(
                child: TextButton(
                  onPressed: _resendCode,
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          text: "Didn't receive the code? ",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        TextSpan(
                          text: 'Resend Code',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
