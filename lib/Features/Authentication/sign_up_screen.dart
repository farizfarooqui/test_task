import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/Constant/app_colors.dart';
import 'package:test_task/Features/Authentication/auth_controller/login_controller.dart';
import 'package:test_task/Features/Authentication/auth_controller/signup_controller.dart';
import 'package:test_task/Features/Authentication/widgets/custom_button.dart';
import 'package:test_task/Features/Authentication/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class SignScreen extends StatelessWidget {
  SignScreen({super.key});
  final controller = Get.put(SignUpController());
  final signController = Get.find<SignUpController>();
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Image.asset(
              'assets/images/Bg_image.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 25,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * 0.04,
                            left: MediaQuery.of(context).size.width * 0.1),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.94,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.2),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0.1,
                              )),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 2,
                                  sigmaY: 2,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  color: Colors.black.withOpacity(0.4),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Spacer(),
                                      const Text(
                                        'Looks like you don\'t have an account.\nlets create a new account for',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        loginController.email,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      const Spacer(),
                                      InputField(
                                        labelText: 'Name',
                                        onChanged: (value) {
                                          signController.name = value;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      InputField(
                                        passwordField: true,
                                        labelText: 'Password',
                                        onChanged: (value) {
                                          signController.password = value;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text.rich(
                                        TextSpan(
                                          text:
                                              'By selecting Agree and continue below,\nI Agree to ',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Terms and Service ',
                                              style: TextStyle(
                                                color: AppColors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'and ',
                                              style: TextStyle(
                                                  color: AppColors.green),
                                            ),
                                            TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                color: AppColors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Obx(
                                        () => CustomButton(
                                            text: 'Agree and Continue',
                                            isLoading:
                                                signController.isLoading.value,
                                            height: 60,
                                            backgroundColor: AppColors.green,
                                            borderColor: AppColors.green,
                                            textColor: Colors.white,
                                            onPressed: () async {
                                              signController.signUp();
                                            },
                                            textfontSize: 15),
                                      ),
                                      const Spacer(),
                                    ],
                                  )),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
