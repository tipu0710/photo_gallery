import 'package:photo_gallery/utils/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, bool>((ref) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<bool> {
  LoginNotifier() : super(sharedPreferences.getBool("login_key") ?? false);
  bool get isLogin => state;
  logout() {
    sharedPreferences.setBool("login_key", false);
    state = false;
  }

  login() {
    sharedPreferences.setBool("login_key", true);
    state = true;
  }
}
