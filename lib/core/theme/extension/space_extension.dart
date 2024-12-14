import 'dart:ui';

import 'package:flutter/material.dart';

/// This is the ThemeExtension used to add custom white space size values
/// into the app theme
class AppSpaceExtension extends ThemeExtension<AppSpaceExtension> {
  final double space_25;
  final double space_50;
  final double space_75;
  final double space_100;
  final double space_125;
  final double space_150;
  final double space_200;

  AppSpaceExtension({
    required this.space_25,
    required this.space_50,
    required this.space_75,
    required this.space_100,
    required this.space_125,
    required this.space_150,
    required this.space_200,
  });

  AppSpaceExtension.fromBaseSpace(double baseSpace)
      : space_25 = baseSpace * 0.25,
        space_50 = baseSpace * 0.50,
        space_75 = baseSpace * 0.75,
        space_100 = baseSpace,
        space_125 = baseSpace * 1.25,
        space_150 = baseSpace * 1.5,
        space_200 = baseSpace * 2;

  @override
  ThemeExtension<AppSpaceExtension> copyWith({
    double? space_25,
    double? space_50,
    double? space_75,
    double? space_100,
    double? space_125,
    double? space_150,
    double? space_200,
  }) {
    return AppSpaceExtension(
      space_25: space_25 ?? this.space_25,
      space_50: space_50 ?? this.space_50,
      space_75: space_75 ?? this.space_75,
      space_100: space_100 ?? this.space_100,
      space_125: space_125 ?? this.space_125,
      space_150: space_150 ?? this.space_150,
      space_200: space_200 ?? this.space_200,
    );
  }

  @override
  ThemeExtension<AppSpaceExtension> lerp(
      covariant ThemeExtension<AppSpaceExtension>? other, double t) {
    if (other is! AppSpaceExtension) {
      return this;
    }
    return AppSpaceExtension(
      space_25: lerpDouble(space_25, other.space_25, t)!,
      space_50: lerpDouble(space_50, other.space_50, t)!,
      space_75: lerpDouble(space_75, other.space_75, t)!,
      space_100: lerpDouble(space_100, other.space_100, t)!,
      space_125: lerpDouble(space_125, other.space_125, t)!,
      space_150: lerpDouble(space_150, other.space_150, t)!,
      space_200: lerpDouble(space_200, other.space_200, t)!,
    );
  }
}
