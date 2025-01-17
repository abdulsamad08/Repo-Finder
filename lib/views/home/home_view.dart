import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transviti_test/controllers/home_controller.dart';
import 'package:transviti_test/core/constants/app_colors.dart';
import 'package:transviti_test/core/constants/image_constant.dart';
import 'package:transviti_test/core/extensions/space_extension.dart';
import 'package:transviti_test/core/utils/widget/shimmer/home_card_shimmer.dart';
import 'package:transviti_test/core/utils/widget/text/text_widget.dart';
import 'package:transviti_test/models/trending_repos_model.dart';
import 'package:transviti_test/views/home/card_widget.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !homeController.isLoading.value) {
        homeController.fetchItems(loadMore: true);
      }
    });

    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryVariant,
            centerTitle: true,
            title: Text("Trending",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.background))),
        body: StreamBuilder<TrendingRepos>(
          stream: homeController.reposStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) => const CardShimmer(),
              );
            } else if (snapshot.hasError) {
              return AnimatedOpacity(
                opacity: snapshot.hasError ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(LottieConstant.errorAnimation),
                    largeSpace,
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                      child: Obx(
                        () => ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  WidgetStateProperty.all(const Size(400, 50))),
                          onPressed: () {
                            if (homeController.isLoading.value == false) {
                              homeController.fetchItems();
                            }
                          },
                          child: homeController.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: AppColors.primary)
                              : Center(
                                  child: text(
                                    context: context,
                                    text: "Retry",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              final trendingRepos = snapshot.data!;
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: ListView.builder(
                  key: ValueKey(trendingRepos),
                  controller: scrollController,
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 10),
                  itemCount: (trendingRepos.items?.length ?? 0) +
                      (homeController.isLoading.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    final items = trendingRepos.items;
                    if (index < (items?.length ?? 0)) {
                      return _buildAnimatedItem(
                          CardWidget(itemData: items![index]));
                    } else if (homeController.isLoading.value) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                            child:
                                CircularProgressIndicator(color: Colors.red)),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              );
            } else {
              return Center(
                child: text(
                  context: context,
                  text: "No Data Available",
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
          },
        ));
  }

  // smooth animation
  Widget _buildAnimatedItem(Widget child) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
        var slideAnimation =
            Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation);

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
