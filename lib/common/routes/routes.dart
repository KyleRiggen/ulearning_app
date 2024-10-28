import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/features/home/view/home.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/features/application/view/application.dart';
import 'package:ulearning_app/features/sign_in/view/sign_in.dart';
import 'package:ulearning_app/features/sign_up/view/sign_up.dart';
import 'package:ulearning_app/features/welcome/view/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutesNames.SIGNIN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.SIGNUP, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.APPLCATION, page: Application()),
      RouteEntity(path: AppRoutesNames.HOME, page: Home()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      // print('clicked route is ${settings.name}');
    }

    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);

      // bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
      // print("deviceFirstTime: $deviceFirstTime");

      if (result.isNotEmpty) {
        // if we used this welcome route for the first time or not
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();

        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          bool isLoggedIn = Global.storageService.isLoggedIn();

          if (isLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => Application(),
              settings: settings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => const SignIn(),
              settings: settings,
            );
          }
        } else {
          if (kDebugMode) {
            // print('app ran for the first time: ${result.first.path}');
          }
          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        }
      }
    }

    return MaterialPageRoute(
      builder: (_) => Welcome(),
      settings: settings,
    );
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.path, required this.page});
}
