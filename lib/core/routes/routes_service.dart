import 'package:get/get.dart';
import 'package:transviti_test/core/bindings/home_binding.dart';
import 'package:transviti_test/views/home/home_view.dart';
import 'package:transviti_test/views/splash/splash_view.dart';
import '../bindings/splash_binding.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';

  static final routes = [
    // splash
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    // home
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
