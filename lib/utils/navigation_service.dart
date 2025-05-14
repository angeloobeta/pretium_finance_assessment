import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToReplacement(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateToAndClearStack(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void goBack() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }

  // Check if can go back
  bool canGoBack() {
    return navigatorKey.currentState!.canPop();
  }
}

// Singleton instance
final navigationService = NavigationService();
