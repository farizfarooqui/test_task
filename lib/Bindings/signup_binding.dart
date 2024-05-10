import 'package:get/get.dart';
import 'package:test_task/Features/Authentication/auth_controller/signup_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => SignUpController());
  }
}