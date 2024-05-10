import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/Bindings/signup_binding.dart';
import 'package:test_task/Constant/app_colors.dart';
import 'package:test_task/Features/Authentication/auth_controller/login_controller.dart';
import 'package:test_task/Features/Authentication/sign_up_screen.dart';
import 'package:test_task/Features/Authentication/widgets/custom_button.dart';
import 'package:test_task/Features/Authentication/widgets/custom_link_button.dart';
import 'package:test_task/Features/Authentication/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  TextEditingController passController = TextEditingController();
  final controller = Get.put(LoginController());

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
                      onPressed: () {},
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
                          'Hi!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.53,
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
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      InputField(
                                          labelText: 'Email',
                                          onChanged: (value) {
                                            controller.email = value;
                                          }),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Obx(
                                        () => CustomButton(
                                          text: 'Continue',
                                          isLoading: controller.isLoading.value,
                                          height: 50,
                                          backgroundColor: AppColors.green,
                                          borderColor: AppColors.green,
                                          textColor: Colors.white,
                                          onPressed: () async {
                                            await controller.verifyEmail();
                                          },
                                          textfontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      const Center(
                                        child: Text(
                                          'Or',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      CustomLinkButton(
                                        text: 'Continue with Facebook',
                                        height: 50,
                                        backgroundColor: Colors.white,
                                        borderColor: Colors.white,
                                        textColor: Colors.black,
                                        onPressed: () {},
                                        textfontSize: 15,
                                        imagePath: 'assets/images/facebook.png',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      CustomLinkButton(
                                        text: 'Continue with Google',
                                        height: 50,
                                        backgroundColor: Colors.white,
                                        borderColor: Colors.white,
                                        textColor: Colors.black,
                                        onPressed: () {},
                                        textfontSize: 15,
                                        imagePath: 'assets/images/google.png',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      CustomLinkButton(
                                        text: 'Continue with Apple',
                                        height: 50,
                                        backgroundColor: Colors.white,
                                        borderColor: Colors.white,
                                        textColor: Colors.black,
                                        onPressed: () {},
                                        textfontSize: 15,
                                        imagePath: 'assets/images/apple.png',
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Dont have an account? ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(() => SignScreen(),
                                                  binding: SignUpBinding());
                                            },
                                            child: const Text(
                                              'SignUp',
                                              style: TextStyle(
                                                  color: AppColors.green),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      const InkWell(
                                          child: Text(
                                        'Forget Password?',
                                        style: TextStyle(
                                          color: AppColors.green,
                                        ),
                                      )),
                                      const SizedBox(
                                        height: 12,
                                      ),
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
