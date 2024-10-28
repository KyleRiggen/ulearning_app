import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/search_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import 'package:ulearning_app/features/home/view/widgets/home_widgets.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final appBarWidgets = AppBarWidgets();
  // final homeWidgets = HomeWidgets();
  final searchWidgets = SearchWidgets();
  final imageWidgets = ImageWidgets();

  late PageController _controller;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _controller =
        PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const HelloText(),
              const UserName(),
              const SizedBox(height: 20),
              searchWidgets.searchBar(),
              const SizedBox(height: 20),
              HomeBanner(ref: ref, controller: _controller),
              HomeMenuBar(),
              CourseItemGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
