import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/app_state.dart';
import 'utils/navigation_service.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppStateContainer(
      child: MaterialApp(
        title: 'Pretium Payment App',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigationService.navigatorKey,
        theme: ThemeData(
          primaryColor: const Color(0xFF0F7269),
          primarySwatch: Colors.teal,
          fontFamily: 'SF Pro Display',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'SF Pro Display',
              ),
        ),
        initialRoute: Routes.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
