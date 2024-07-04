import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final appBarWidget = AppBarWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget.buildAppBar(title: 'Application'),
    );
  }
}
