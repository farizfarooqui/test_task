import 'package:get/get.dart';
import 'package:test_task/Features/Authentication/auth_controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
