import 'package:flutter/material.dart';

class AppPages {
  static List<dynamic> routes() {
    return [];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    print('my route name is ${settings.name}');

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Container(),
      ),
      settings: settings,
    );
  }
}
