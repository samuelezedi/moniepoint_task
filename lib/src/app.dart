import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/presentation/home/home.dart';
import 'package:moniepoint_test/src/shared/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Moniepoint Test',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: appLightTheme,
        home: const HomePage());
  }
}
