import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/services/http_util.dart';
import 'package:ulearning_app/common/values/app_styles.dart';
import 'package:ulearning_app/global.dart';

Future<void> main() async {
  await Global.init();
  //HttpUtil().post("/api/login");
  // test github desktop

  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      title: 'Capstone Project',
      theme: AppTheme.appThemeData,
      initialRoute: '/',
      onGenerateRoute: AppPages.generateRouteSettings,
    );
  }
}
