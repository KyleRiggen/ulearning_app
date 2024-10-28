import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/features/welcome/provider/welcome_notifier.dart';
import 'package:ulearning_app/features/welcome/view/widgets/welcome_widgets.dart';

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watches the prviously defined provider
    // indexDotProvider is coming from *welcome_notifier.g.dart*
    final index = ref.watch(indexDotProvider);
    //return Placeholder();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          body: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged: (value) {
                    // able to now change the provider based on the change from the page
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    // first page
                    AppOnboardingPage(
                      controller: _controller,
                      imagePath: ImageRes.reading,
                      title: 'First See Learning',
                      subTitle:
                          'Forget about the paper, now learning all in one place',
                      index: 1,
                      context: context,
                    ),

                    // second page
                    AppOnboardingPage(
                      controller: _controller,
                      imagePath: ImageRes.man,
                      title: 'Connect with Everyone',
                      subTitle:
                          'Always keep in touch with your tutor and friends. Lets get connected!',
                      index: 2,
                      context: context,
                    ),

                    // third
                    AppOnboardingPage(
                      controller: _controller,
                      imagePath: ImageRes.boy,
                      title: 'Always fascinated learning',
                      subTitle:
                          'Anywhere, anytime.  The time is at your descretion',
                      index: 3,
                      context: context,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    dotsCount: 3,

                    // consuming the riverpod provider to display the current dot
                    position: index,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      size: const Size.square(9),
                      activeSize: const Size(18, 8),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
