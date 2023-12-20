import 'package:flutter/material.dart';
import 'package:photo_gallery/screen/home/home.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeLocation = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Home(),
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "splashLogo",
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 170,
                ),
              ),
              const SizedBox(height: 13),
              const Text(
                'Login to Photo Gallery',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffffffff),
                  letterSpacing: 0.6,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Unveil Moments, Embrace the Unexpected!',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffffffff),
                  letterSpacing: 0.6,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
