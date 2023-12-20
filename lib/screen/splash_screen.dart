import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_gallery/provider/login_provider.dart';
import 'package:photo_gallery/screen/home/home.dart';
import 'package:photo_gallery/screen/login/login_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const String routeLocation = "/splash";

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      if (mounted) {
        var login = ref.read(loginProvider.notifier).isLogin;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => login ? const Home() : const LoginScreen(),
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "splashLogo",
          child: Image.asset(
            "assets/images/logo.png",
            width: 170,
          ),
        ),
      ),
    );
  }
}
