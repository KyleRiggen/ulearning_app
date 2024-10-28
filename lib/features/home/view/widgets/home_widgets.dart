import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/values/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadow.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import 'package:ulearning_app/global.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key, required this.controller, required this.ref});

  Widget bannerContainer({required String imagePath}) {
    return Container(
      width: 400,
      height: 160,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // images
        SizedBox(
          width: 400,
          height: 200,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        const SizedBox(height: 5),
        // dots
        DotsIndicator(
          dotsCount: 3,

          // consuming the riverpod provider to display the current dot
          position: ref.watch(homeScreenBannerDotsProvider),
          // mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
            size: const Size.square(9),
            activeSize: const Size(18, 8),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      Global.storageService.getUserProfile().name!,
      style: const TextStyle(
        color: AppColors.primaryText,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "hello, ",
      style: TextStyle(
        color: AppColors.primaryThirdElementText,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

AppBar homeAppBar() {
  final imageWidgets = ImageWidgets();

  return AppBar(
    title: Container(
      margin: const EdgeInsets.only(
        left: 7,
        right: 7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          imageWidgets.appImage(
            imagePath: ImageRes.menu,
            width: 18,
            height: 12,
          ),
          GestureDetector(
            child: const AppBoxDecorationImage(),
          )
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  HomeMenuBar({super.key});
  final appShadow = AppShadow();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text16Normal(
                text: "Choose your course",
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                child: const Text10Normal(
                  text: "See All",
                ),
              ),
            ],
          ),
        ),
        // course item button
        const SizedBox(height: 20),
        Row(
          children: [
            Container(
              decoration: appShadow.appBoxShadow(
                color: AppColors.primaryElement,
                radius: 7,
              ),
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
                bottom: 5,
              ),
              child: const Text11Normal(
                // color: AppColors.primaryElement,
                text: "All",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text11Normal(
                text: "Popular",
                color: AppColors.primaryThirdElementText,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: const Text11Normal(
                text: "Newest",
                color: AppColors.primaryThirdElementText,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  CourseItemGrid({super.key});
  final imageWidgets = ImageWidgets();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 40,
        ),
        itemCount: 6,
        itemBuilder: (_, int index) {
          return imageWidgets.appImage();
        },
      ),
    );
  }
}
