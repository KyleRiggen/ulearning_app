import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/values/app_colors.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/application/provider/application_nav_notifier.dart';
import 'package:ulearning_app/features/home/view/home.dart';

final imageWidgets = ImageWidgets();

var bottomTabs = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Icons.home, color: AppColors.primaryBackground),
    activeIcon: Icon(Icons.home, color: AppColors.primaryElement),
    backgroundColor: Colors.blue,
    label: "Home",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.search, color: AppColors.primaryBackground),
    activeIcon: Icon(Icons.search, color: AppColors.primaryElement),
    backgroundColor: Colors.blue,
    label: "Search",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.play_arrow, color: AppColors.primaryBackground),
    activeIcon: Icon(Icons.play_arrow, color: AppColors.primaryElement),
    backgroundColor: Colors.blue,
    label: "Play",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.message,
        color: AppColors.primaryBackground), // Using built-in Flutter icon
    activeIcon: Icon(Icons.message,
        color: AppColors.primaryElement), // Active icon with different color
    backgroundColor: Colors.blue,
    label: "Message",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person,
        color: AppColors.primaryBackground), // Using built-in Flutter icon
    activeIcon: Icon(Icons.person,
        color: AppColors.primaryElement), // Active icon with different color
    backgroundColor: Colors.blue,
    label: "Profile",
  ),
];

Widget appScreens({int index = 0}) {
  List<Widget> _screens = [
    Home(),
    Center(
        child: imageWidgets.appImage(
      imagePath: ImageRes.search,
      width: 250,
      height: 250,
    )),
    Center(
        child: imageWidgets.appImage(
      imagePath: ImageRes.play,
      width: 250,
      height: 250,
    )),
    Center(
        child: imageWidgets.appImage(
      imagePath: ImageRes.message,
      width: 250,
      height: 250,
    )),
    Center(
        child: imageWidgets.appImage(
      imagePath: ImageRes.profile,
      width: 250,
      height: 250,
    )),
  ];

  return _screens[index];
}

// Widget _bottomContainer({
//   double width = 15,
//   double height = 15,
//   String imagePath = "assets/icons/home.png",
//   Color color = Colors.yellow,
// }) {
//   return Container(
//     width: width,
//     height: height,
//     child: imageWidgets.appImageWithColor(
//       imagePath: imagePath,
//       color: color,
//     ),
//   );
// }
