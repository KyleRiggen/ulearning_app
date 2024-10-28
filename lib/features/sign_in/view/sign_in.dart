import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/values/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign_in/provider/sign_in_notifier.dart';
import 'package:ulearning_app/features/sign_in/controller/sign_in_controller.dart';
import 'package:ulearning_app/features/sign_in/view/widgets/sign_in_widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  final appBarWidget = AppBarWidgets();
  final signInWidgets = SignInWidgets();
  final textWidgets = TextWidgets();
  final buttonWidgets = ButtonWidgets();

  late SignInController _controller;

  @override
  void didChangeDependencies() {
    _controller = SignInController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // needed?
    // final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: appBarWidget.buildAppBar(title: 'Login'),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // top login buttons
                      signInWidgets.thirdPartyLogin(),
                      // more login options text
                      const Center(
                          child: Text14Normal(
                              text: 'Or use your email account to login')),
                      const SizedBox(height: 50),
                      textWidgets.appTextFeild(
                        controller: _controller.emailController,
                        text: 'Email',
                        iconName: ImageRes.user,
                        hintText: 'Enter your email',
                        func: (value) {
                          ref
                              .read(signInNotifierProvider.notifier)
                              .onUserEmailChange(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      textWidgets.appTextFeild(
                        controller: _controller.passwordController,
                        text: 'Password',
                        iconName: ImageRes.lock,
                        hintText: 'enter your password',
                        obscureText: true,
                        func: (value) {
                          ref
                              .read(signInNotifierProvider.notifier)
                              .onUserPasswordChange(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child:
                            textWidgets.textUnderline(text: 'Forgot password?'),
                      ),
                      const SizedBox(height: 100),
                      Center(
                        child: buttonWidgets.appButton(
                          context,
                          buttonName: 'Login',
                          isLogin: true,
                          func: () {
                            _controller.handleSignIn(ref);
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: buttonWidgets.appButton(
                          context,
                          buttonName: 'Sign Up',
                          isLogin: false,
                          func: () => Navigator.pushNamed(
                            context,
                            '/signUp',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
