import 'package:challenge_3/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:challenge_3/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final menuOptions= AppRoutes.menuOptions;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Challenge Nro. 3'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(menuOptions[index].icon, color: AppTheme.primaryColor),
                  title:   Text(menuOptions[index].name, style: const TextStyle(fontSize: 20)),
                  onTap: () {
                    //final rout = MaterialPageRoute(
                    //    builder: (context) => const Listview1Screen());
                    //Navigator.push(context, rout);

                    Navigator.pushNamed(context, menuOptions[index].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: menuOptions.length
            ));
  }
}
