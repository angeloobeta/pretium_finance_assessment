import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';
import 'package:pretium_finance_assessment/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Accept Payments',
      'description': 'Accept stablecoin payments hassle-free',
      'icon': Icons.account_balance_wallet,
      'color': 0xFF0F7269, // Teal color
    },
    {
      'title': 'Direct Pay',
      'description': 'Pay with crypto across Africa effortlessly',
      'icon': Icons.credit_card,
      'color': 0xFF0F7269, // Teal color
    },
    {
      'title': 'Pay Bills',
      'description': 'Pay for utility services and earn rewards',
      'icon': Icons.receipt_long,
      'color': 0xFF0F7269, // Teal color
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSkip() {
    navigationService.navigateToAndClearStack(Routes.login);
  }

  void _onNext() {
    if (_currentPage == _pages.length - 1) {
      // If last page, navigate to login
      navigationService.navigateToAndClearStack(Routes.login);
    } else {
      // Go to next page
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _onSkip,
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Page View
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    title: _pages[index]['title'],
                    description: _pages[index]['description'],
                    icon: _pages[index]['icon'],
                    color: _pages[index]['color'],
                  );
                },
              ),
            ),

            // Page Indicator
            Container(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pages.length,
                  (index) => _buildPageIndicator(index),
                ),
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: CustomButton(
                text:
                    _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                onPressed: _onNext,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    bool isActive = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF0F7269) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final int color;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon Container
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xFFE5F2F1), // Light teal background
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(
              icon,
              size: 56,
              color: Color(color),
            ),
          ),
          const SizedBox(height: 48),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
