import 'package:challenge_3/models/models.dart';


import '../screens/screens.dart';

import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    //MenuOption(
    //  name: 'Home Screen',
    //  route: 'home',
    //  screen: const HomeScreen(),
    //  icon: Icons.home,
    //),
    
    MenuOption(
      name: 'Ejemplo StatelessWidget',
      route: 'statelessWidgetSample',
      screen: const CardScreen(),
      icon: Icons.blur_off,
    ),
    
    MenuOption(
      name: 'Ejemplo StatefulWidget',
      route: 'statefulWidgetSample',
      screen: const AnimatedScreen(),
      icon: Icons.animation,
    ),
    
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (var option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  //static Map<String, Widget Function(BuildContext)> routes= {
  //    'home': (BuildContext context) => const HomeScreen(),
  //    'card': (BuildContext context) => const CardScreen(),
  //    'animated': (BuildContext context) => const AnimatedScreen(),
  //};

  //static Route<dynamic> onGenerateRoute(RouteSettings settings) {
  //  return MaterialPageRoute(
  //    builder: (context) => const AlertScreen(),
  //  );
  //}

}