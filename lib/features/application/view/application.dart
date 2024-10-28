import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/values/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/features/application/provider/application_nav_notifier.dart';
import 'package:ulearning_app/features/application/view/widgets/application_widgets.dart';

class Application extends ConsumerWidget {
  Application({super.key});
  final appShadow = AppShadow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: appScreens(index: index),
          bottomNavigationBar: Container(
            width: 375,
            height: 58,
            decoration: appShadow.appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                ref
                    .read(applicationNavIndexProvider.notifier)
                    .changeIndex(value);
              },

              elevation: 0,
              items: bottomTabs,
              backgroundColor: Colors.green,
              //type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryBackground,
            ),
          ),
        ),
      ),
    );
  }
}
