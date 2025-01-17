import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transviti_test/core/constants/app_colors.dart';

Widget circleAvatarShimmer(
    {required double height,
    required double width,
    required BuildContext context}) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  Color baseColor = isDarkMode ? Colors.grey[700]! : Colors.grey[300]!;
  Color highlightColor = isDarkMode ? Colors.grey[500]! : Colors.grey[100]!;

  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.background,
      ),
    ),
  );
}

Widget textShimmer(
    {required double height,
    required double width,
    required BuildContext context}) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  Color baseColor = isDarkMode ? Colors.grey[700]! : Colors.grey[300]!;
  Color highlightColor = isDarkMode ? Colors.grey[500]! : Colors.grey[100]!;

  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: Container(
      height: height,
      width: width,
      color: AppColors.background,
    ),
  );
}
