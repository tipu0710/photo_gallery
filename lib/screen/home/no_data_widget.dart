import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.title, this.onRetry});

  final String title;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 50),
          SvgPicture.asset(
            "assets/svg/sad.svg",
            height: 67,
            width: 67,
          ),
          const SizedBox(height: 15.5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff919191),
              height: 1.3571428571428572,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15.5),
          if (onRetry != null)
            ElevatedButton(
              onPressed: onRetry,
              child: const Text(
                "Retry",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff919191),
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
