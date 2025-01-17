import 'package:get/get.dart';
import 'package:transviti_test/core/routes/routes_service.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
    Get.offNamed(AppRoutes.home);
  }
}
