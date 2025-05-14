// screens/profile/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/services/auth_service.dart';
import 'package:pretium_finance_assessment/utils/app_state.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    final user = appState.currentUser;
    final authService = AuthService();

    void _showSignOutDialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sign out', style: TextStyle(fontSize: 24)),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close dialog
                await authService.logout();
                appState.updateUser(null);

                if (context.mounted) {
                  navigationService.navigateToAndClearStack(Routes.login);
                }
              },
              child: const Text(
                'Sign out',
                style: TextStyle(color: Color(0xFF0F7269)),
              ),
            ),
          ],
        ),
      );
    }

    void _showDeleteAccountDialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Account', style: TextStyle(fontSize: 24)),
          content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () async {
                // In a real app, you would call an API to delete the account
                Navigator.pop(context); // Close dialog
                await authService.logout();
                appState.updateUser(null);

                if (context.mounted) {
                  navigationService.navigateToAndClearStack(Routes.login);
                }
              },
              child: const Text(
                'Delete Account',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => navigationService.goBack(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade200,
                    child: Text(
                      _getInitials(user?.name ?? 'User'),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Coming Soon',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                // Edit profile functionality
                              },
                              child: const Icon(Icons.edit, color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          user?.email ?? 'user@example.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),

            // Settings List
            _buildSettingItem(
              icon: Icons.attach_money,
              title: 'Currency',
              trailing: const Text(
                'NGN',
                style: TextStyle(
                  color: Color(0xFF0F7269),
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Currency selection functionality
              },
            ),

            _buildSettingItem(
              icon: Icons.account_balance_wallet,
              title: 'Assets',
              onTap: () => navigationService.navigateTo(Routes.assets),
            ),

            _buildSettingItem(
              icon: Icons.swap_horiz,
              title: 'Wallet Address',
              onTap: () => navigationService.navigateTo(Routes.walletAddress),
            ),

            _buildSettingItem(
              icon: Icons.support_agent,
              title: 'Contact Support',
              trailing: const Icon(Icons.open_in_new, color: Colors.grey),
              onTap: () {
                // Open support URL
              },
            ),

            _buildSettingItem(
              icon: Icons.description,
              title: 'Terms and Conditions',
              trailing: const Icon(Icons.open_in_new, color: Colors.grey),
              onTap: () {
                // Open terms and conditions URL
              },
            ),

            _buildSettingItem(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              trailing: const Icon(Icons.open_in_new, color: Colors.grey),
              onTap: () {
                // Open privacy policy URL
              },
            ),

            _buildSettingItem(
              icon: Icons.phone_android,
              title: 'App Version',
              trailing: const Text(
                '1.0.0+16',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: null,
            ),

            _buildSettingItem(
              icon: Icons.logout,
              title: 'Sign out',
              onTap: _showSignOutDialog,
            ),

            _buildSettingItem(
              icon: Icons.delete_forever,
              title: 'Delete Account',
              onTap: _showDeleteAccountDialog,
              iconColor: Colors.red,
            ),

            // Rate App Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Rate app functionality
                },
                icon: const Icon(Icons.thumb_up, color: Colors.amber),
                label: const Text('Rate App 👍'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return nameParts[0][0].toUpperCase() + nameParts[1][0].toUpperCase();
    } else {
      return name.isNotEmpty ? name[0].toUpperCase() : 'U';
    }
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback? onTap,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? const Color(0xFF0F7269),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
