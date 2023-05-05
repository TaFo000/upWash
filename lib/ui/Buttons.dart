
import 'package:flutter/material.dart';

import '../upWashColors.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final bool enabled;
  final VoidCallback onTap;


  const PrimaryButton(
      {Key? key,
        required this.title,
        required this.onTap,
        this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UpWashColors upwashColors = Theme.of(context).extension<UpWashColors>()!;
    return Container(
      height: 54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: upwashColors.primaryOrange),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: (enabled) ? onTap : null,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: (enabled)
                      ? Colors.white
                      : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DefaultButton(
      {Key? key,
        required this.title,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xffFF6600)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}



