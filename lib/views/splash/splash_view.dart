import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transviti_test/core/constants/image_constant.dart';
import 'package:transviti_test/core/extensions/space_extension.dart';
import 'package:transviti_test/core/utils/widget/text/text_widget.dart';
import '../../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.find<SplashController>();

    return Scaffold(
      body: Center(
        child: Obx(() {
          if (splashController.isLoading.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: splashController.isLoading.value ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    ImageConstant.appLogo,
                    height: 150,
                    width: 150,
                  ),
                ),
                smallSpaceTwo,
                AnimatedOpacity(
                  opacity: splashController.isLoading.value ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: text(
                    context: context,
                    text: "Welcome to Trending Repo Finder",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        }),
      ),
    );
  }
}
