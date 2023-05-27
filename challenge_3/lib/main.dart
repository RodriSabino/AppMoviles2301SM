import 'package:flutter/material.dart';

import 'package:challenge_3/router/app_routes.dart';
import 'package:challenge_3/theme/app_theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: const HomeScreen(),
      initialRoute:    AppRoutes.initialRoute,
      routes:          AppRoutes.getAppRoutes(),
      theme:           AppTheme.lightTheme,
    );
  }
}

