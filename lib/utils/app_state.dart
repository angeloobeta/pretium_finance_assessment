import 'package:flutter/material.dart';
import 'package:pretium_finance_assessment/models/user.dart';


class AppState extends InheritedWidget {
  final User? currentUser;
  final Function(User?) updateUser;

  const AppState({
    Key? key,
    required this.currentUser,
    required this.updateUser,
    required Widget child,
  }) : super(key: key, child: child);

  static AppState of(BuildContext context) {
    final AppState? result =
        context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(result != null, 'No AppState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return currentUser != oldWidget.currentUser;
  }
}

class AppStateContainer extends StatefulWidget {
  final Widget child;

  const AppStateContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _AppStateContainerState createState() => _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  User? _currentUser;

  void _updateUser(User? user) {
    setState(() {
      _currentUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      currentUser: _currentUser,
      updateUser: _updateUser,
      child: widget.child,
    );
  }
}
