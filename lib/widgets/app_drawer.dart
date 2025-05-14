import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/services/auth_service.dart';
import 'package:pretium_finance_assessment/utils/app_state.dart';
import 'package:pretium_finance_assessment/utils/navigation_service.dart';
import 'package:pretium_finance_assessment/utils/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    final user = appState.currentUser;
    final authService = AuthService();

    void _showSignOutDialog() {
      Navigator.pop(context); // Close drawer first
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
      Navigator.pop(context); // Close drawer first
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

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF0F7269),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Text(
                        _getInitials(user?.name ?? 'User'),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F7269),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Coming Soon',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  // Edit profile functionality
                                },
                                child: const Icon(Icons.edit,
                                    color: Colors.white70),
                              ),
                            ],
                          ),
                          Text(
                            user?.email ?? 'user@example.com',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Currency
          _buildDrawerItem(
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
              Navigator.pop(context); // Close drawer
              // Currency selection functionality
            },
          ),

          // Assets
          _buildDrawerItem(
            icon: Icons.account_balance_wallet,
            title: 'Assets',
            onTap: () {
              Navigator.pop(context); // Close drawer
              navigationService.navigateTo(Routes.assets);
            },
          ),

          // Wallet Address
          _buildDrawerItem(
            icon: Icons.swap_horiz,
            title: 'Wallet Address',
            onTap: () {
              Navigator.pop(context); // Close drawer
              navigationService.navigateTo(Routes.walletAddress);
            },
          ),

          // Contact Support
          _buildDrawerItem(
            icon: Icons.support_agent,
            title: 'Contact Support',
            trailing: const Icon(Icons.open_in_new, color: Colors.grey),
            onTap: () {
              Navigator.pop(context); // Close drawer
              // Open support URL
            },
          ),

          // Terms and Conditions
          _buildDrawerItem(
            icon: Icons.description,
            title: 'Terms and Conditions',
            trailing: const Icon(Icons.open_in_new, color: Colors.grey),
            onTap: () {
              Navigator.pop(context); // Close drawer
              // Open terms and conditions URL
            },
          ),

          // Privacy Policy
          _buildDrawerItem(
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            trailing: const Icon(Icons.open_in_new, color: Colors.grey),
            onTap: () {
              Navigator.pop(context); // Close drawer
              // Open privacy policy URL
            },
          ),

          // App Version
          _buildDrawerItem(
            icon: Icons.phone_android,
            title: 'App Version',
            trailing: const Text(
              '1.0.0+16',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: null,
          ),

          const Divider(),

          // Sign out
          _buildDrawerItem(
            icon: Icons.logout,
            title: 'Sign out',
            onTap: _showSignOutDialog,
          ),

          // Delete Account
          _buildDrawerItem(
            icon: Icons.delete_forever,
            title: 'Delete Account',
            onTap: _showDeleteAccountDialog,
            iconColor: Colors.red,
          ),

          const SizedBox(height: 20),

          // Rate App Button
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // Close drawer
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
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ],
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

  Widget _buildDrawerItem({
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
