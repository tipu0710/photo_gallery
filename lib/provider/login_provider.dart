import 'package:flutter/material.dart';
import 'package:photo_gallery/screen/home/home.dart';
import 'package:photo_gallery/screen/login/login_screen.dart';
import 'package:photo_gallery/utils/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, bool>((ref) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<bool> {
  LoginNotifier() : super(sharedPreferences.getBool("login_key") ?? false);
  bool get isLogin => state;
  logout(BuildContext context) {
    sharedPreferences.setBool("login_key", false);
    state = false;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }

  login(BuildContext context) {
    sharedPreferences.setBool("login_key", true);
    state = true;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
        (route) => false);
  }
}
