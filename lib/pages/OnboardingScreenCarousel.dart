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
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 82),
            child: Image.asset('assets/images/logo.png',
            fit: BoxFit.fitWidth,
        ),
          ),

              Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
              ),

          Align(
            alignment: Alignment.center,
            child: Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}