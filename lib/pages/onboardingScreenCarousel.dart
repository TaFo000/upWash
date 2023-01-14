import 'package:flutter/material.dart';

class OnboardingScreenCarousel extends StatelessWidget {
  final String title;
  final String text;
  final String imagePath;

  const OnboardingScreenCarousel(
      {super.key,
        required this.title,
        required this.text,
        required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 82),
            child: Image.asset('assets/images/logo.png',
              height: 120,
              width: 120,
              fit: BoxFit.fitWidth,
            ),
          ),

          Image.asset(
            imagePath,
            height: 324,
            width: 324,
            fit: BoxFit.fitWidth,
          ),
          Text(title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 25,
          ), Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
        ],
      ),
    );
  }
}