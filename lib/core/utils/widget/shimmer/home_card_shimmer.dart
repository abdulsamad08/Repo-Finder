import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transviti_test/core/constants/app_colors.dart';
import 'package:transviti_test/core/extensions/space_extension.dart';
import 'package:transviti_test/core/utils/widget/shimmer/shimmer_widget.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final double widthFactor = Get.width * 0.2;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      margin: const EdgeInsets.only(top: 20),
      elevation: 4.0,
      shadowColor: AppColors.primary.withOpacity(.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDarkMode ? AppColors.primaryVariant : AppColors.background,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 10.0,
          leading: circleAvatarShimmer(context: context, height: 60, width: 60),
          title:
              textShimmer(context: context, height: 14, width: Get.width * 0.1)
                  .paddingOnly(right: Get.width * 0.3),
          subtitle: Column(
            children: [
              shortSpace,
              Row(
                children: [
                  shortSpace,
                  textShimmer(context: context, height: 13, width: widthFactor),
                  const Spacer(),
                  textShimmer(context: context, height: 13, width: widthFactor),
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerRow(context, widthFactor),
                  shortSpace,
                  _buildShimmerRow(context, widthFactor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildShimmerRow(BuildContext context, double widthFactor) {
    return Row(
      children: [
        textShimmer(context: context, height: 13, width: widthFactor),
        const Spacer(),
        textShimmer(context: context, height: 13, width: widthFactor),
      ],
    );
  }
}
