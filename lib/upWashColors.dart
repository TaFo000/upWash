import 'package:flutter/material.dart';

@immutable
class UpWashColors extends ThemeExtension<UpWashColors> {
  UpWashColors({
    required this.primaryOrange,
    required this.textColor,
    required this.iconButtonColor,
    required this.homePageDraggableSheet,
    required this.backgroundColor,
    required this.shadowColor,
    required this.homeBackgroundColor
  });

  final Color? primaryOrange;
  final Color? textColor;
  final Color? iconButtonColor;
  final Color? homePageDraggableSheet;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? homeBackgroundColor;

  @override
  UpWashColors copyWith({
    Color? primaryOrange,
    Color? textColor,
    Color? iconButtonColor,
    Color? homePageDraggableSheet,
    Color? backgroundColor,
    Color? shadowColor,
    Color? homeBackgroundColor
  }) => UpWashColors(
      primaryOrange: primaryOrange ?? this.primaryOrange,
      textColor: textColor ?? this.textColor,
      iconButtonColor: iconButtonColor ?? this.iconButtonColor,
      homePageDraggableSheet: homePageDraggableSheet ?? this.homePageDraggableSheet,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      homeBackgroundColor: homeBackgroundColor ?? this.homeBackgroundColor
  );

  @override
  UpWashColors lerp(ThemeExtension<UpWashColors>? other, double t) {
    if (other is! UpWashColors) {
      return this;
    }
    return UpWashColors(
      primaryOrange: Color.lerp(primaryOrange, other.primaryOrange, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      iconButtonColor: Color.lerp(iconButtonColor, other.iconButtonColor, t),
      homePageDraggableSheet: Color.lerp(homePageDraggableSheet, other.homePageDraggableSheet, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
      homeBackgroundColor: Color.lerp(homeBackgroundColor, other.homeBackgroundColor, t),
    );
  }
}