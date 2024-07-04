import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/popup_messages.dart';
import 'package:ulearning_app/pages/sign_up/notifier/sign_up_notifier.dart';

class SignUpController {
  final popUpMessages = PopupMessages();
  final WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(signUpNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (name.isEmpty || state.userName.isEmpty) {
      popUpMessages.toastInfo('username is empty');
    }

    if (name.length < 6 || state.userName.length < 6) {
      popUpMessages.toastInfo('username is too short');
    }

    if (email.isEmpty || state.email.isEmpty) {
      popUpMessages.toastInfo('email is empty');
    }

    if (state.password.isEmpty ||
        state.rePassword.isEmpty ||
        password.isEmpty ||
        rePassword.isEmpty) {
      popUpMessages.toastInfo('password is empty');
    }

    if ((state.password != state.rePassword) || (password != rePassword)) {
      popUpMessages.toastInfo('passwords did not match');
    }

    // show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);

    //Future.delayed(const Duration(seconds: 2), () async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        // get server photo url
        // set user photo url
        popUpMessages.toastInfo('email has been set to verify your account');
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      String eCode = e.code;

      if (e.code == 'weak-password') {
        popUpMessages.toastInfo('the password is too weak');
      } else if (e.code == 'email-already-in-use') {
        popUpMessages.toastInfo('email already in use');
      } else if (e.code == 'user-not-found') {
        popUpMessages.toastInfo('user not found');
      } else {
        popUpMessages.toastInfo('unknown error: $eCode');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    // show the register page
    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
    // });
  }
}
