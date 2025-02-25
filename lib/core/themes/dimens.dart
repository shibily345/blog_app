import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class Dimens {
  const Dimens();

  /// General horizontal padding used to separate UI items
  static const paddingHorizontal = 20.0;

  /// General vertical padding used to separate UI items
  static const paddingVertical = 24.0;

  /// Horizontal padding for screen edges
  double get paddingScreenHorizontal;

  /// Vertical padding for screen edges
  double get paddingScreenVertical;

  double get profilePictureSize;

  /// Horizontal symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal.w);

  /// Symmetric padding for screen edges
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
      horizontal: paddingScreenHorizontal.h, vertical: paddingScreenVertical.h);

  static const Dimens desktop = _DimensDesktop();
  static Dimens mobile = _DimensMobile();

  /// Get dimensions definition based on screen size
  factory Dimens.of(BuildContext context) =>
      switch (MediaQuery.sizeOf(context).width) {
        > 600 => desktop,
        _ => mobile,
      };
}

/// Mobile dimensions
final class _DimensMobile extends Dimens {
  @override
  final double paddingScreenHorizontal = Dimens.paddingHorizontal.w;

  @override
  final double paddingScreenVertical = Dimens.paddingVertical.h;

  @override
  final double profilePictureSize = 64.0;

  _DimensMobile();
}

/// Desktop/Web dimensions
final class _DimensDesktop extends Dimens {
  @override
  final double paddingScreenHorizontal = 100.0;

  @override
  final double paddingScreenVertical = 64.0;

  @override
  final double profilePictureSize = 128.0;

  const _DimensDesktop();
}
