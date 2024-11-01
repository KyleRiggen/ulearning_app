import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/values/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_bar.dart';
import 'package:ulearning_app/common/widgets/button_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign_in/view/widgets/sign_in_widgets.dart';
import 'package:ulearning_app/features/sign_up/provider/sign_up_notifier.dart';
import 'package:ulearning_app/features/sign_up/controller/sign_up_controller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final signInWidgets = SignInWidgets();
  final appBarWidgets = AppBarWidgets();
  final textWidgets = TextWidgets();
  final buttonWidgets = ButtonWidgets();
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // connecting to a notifier provider (auto generated code)
    // ignore: unused_local_variable
    final signUpProvider = ref.watch(signUpNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    print(loader);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: appBarWidgets.buildAppBar(title: 'Sign Up'),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const Center(
                        child: Text14Normal(
                            text: 'Enter your details below and free sign up'),
                      ),
                      const SizedBox(height: 50),
                      textWidgets.appTextFeild(
                        text: 'Username',
                        iconName: ImageRes.user,
                        hintText: 'Enter your username',
                        func: (value) {
                          ref
                              .read(signUpNotifierProvider.notifier)
                              .onUserNameChange(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      textWidgets.appTextFeild(
                        text: 'Email',
                        iconName: ImageRes.user,
                        hintText: 'Enter your email',
                        func: (value) {
                          ref
                              .read(signUpNotifierProvider.notifier)
                              .onUserEmailChange(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      textWidgets.appTextFeild(
                        text: 'Password',
                        iconName: ImageRes.lock,
                        hintText: 'enter your password',
                        func: (value) {
                          ref
                              .read(signUpNotifierProvider.notifier)
                              .onUserPasswordChange(value);
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      textWidgets.appTextFeild(
                        text: 'Confirm Password',
                        iconName: ImageRes.lock,
                        hintText: 'confirm your password',
                        func: (value) {
                          ref
                              .read(signUpNotifierProvider.notifier)
                              .onUserRePasswordChange(value);
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 30.0),
                        child: Text14Normal(text: 'Terms and conditions'),
                      ),
                      const SizedBox(height: 100),
                      Center(
                        child: buttonWidgets.appButton(
                          context,
                          buttonName: 'Sign Up',
                          isLogin: true,
                          func: () {
                            _controller.handleSignUp();
                          },
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
