import 'package:get/get.dart';
import 'package:transviti_test/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
