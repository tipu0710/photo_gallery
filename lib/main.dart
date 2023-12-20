import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_gallery/provider/login_provider.dart';
import 'package:photo_gallery/screen/home/home.dart';
import 'package:photo_gallery/screen/login/login_screen.dart';
import 'package:photo_gallery/screen/splash_screen.dart';
import 'package:photo_gallery/utils/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoggedIn = ref.watch(loginProvider);
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: !shownSplash
          ? const SplashScreen()
          : isLoggedIn
              ? const Home()
              : const LoginScreen(),
    );
  }
}
