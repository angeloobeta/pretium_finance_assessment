// widgets/custom_bottom_nav.dart
import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.account_balance_wallet,
            isSelected: currentIndex == 0,
            onTap: () {
              if (currentIndex != 0) {
                navigationService.navigateToAndClearStack(Routes.home);
              }
            },
          ),
          _buildNavItem(
            icon: Icons.qr_code,
            isSelected: currentIndex == 1,
            onTap: () {
              if (currentIndex != 1) {
                navigationService.navigateTo(Routes.address);
              }
            },
            isCircular: true,
          ),
          _buildNavItem(
            icon: Icons.receipt_long,
            isSelected: currentIndex == 2,
            onTap: () {
              if (currentIndex != 2) {
                navigationService.navigateTo(Routes.transactions);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    bool isCircular = false,
  }) {
    if (isCircular) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF0F7269),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F7269).withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        color: Colors.transparent,
        child: Icon(
          icon,
          color: isSelected ? const Color(0xFF0F7269) : Colors.grey.shade600,
          size: 28,
        ),
      ),
    );
  }
}
