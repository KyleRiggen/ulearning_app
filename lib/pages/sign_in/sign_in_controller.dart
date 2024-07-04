import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/popup_messages.dart';
import 'package:ulearning_app/common/values/constants.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/sign_in/notifier/sign_in_notifier.dart';

class SignInController {
  final popUpMessages = PopupMessages();
  late WidgetRef ref;

  SignInController({required this.ref});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn() async {
    var state = ref.read(signInNotifierProvider);

    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    print('my email is $email, and password is $password');

    if (email.isEmpty || state.email.isEmpty) {
      popUpMessages.toastInfo('email is empty');
    }

    if (state.password.isEmpty || password.isEmpty) {
      popUpMessages.toastInfo('password is empty');
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user == null) {
        popUpMessages.toastInfo('user not found');
        return;
      }

      if (!credential.user!.emailVerified) {
        popUpMessages.toastInfo('you must verify your email');
        return;
      }

      var user = credential.user;

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;

        asyncPostAllData(loginRequestEntity);

        print('user logged in');
      } else {
        popUpMessages.toastInfo('login error, user is null?');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        popUpMessages.toastInfo('user not found');
      } else if (e.code == 'wrong-password') {
        popUpMessages.toastInfo('wrong password');
      } else {
        String eCode = e.code;
        popUpMessages.toastInfo('unknown error: $eCode');
      }
    } catch (e) {
      print(e);
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // talk to server

    // have local storage
    try {
      var navigator = Navigator.of(ref.context);

      Global.storageService
          .setString(AppConstants.STORAGE_USER_PROFILE_KEY, '123');
      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345');

      navigator.pushNamedAndRemoveUntil('/application', (route) => false);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    // redirect to new page
  }
}
