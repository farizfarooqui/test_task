import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:test_task/Constant/app_colors.dart';
import 'package:test_task/Features/Authentication/auth_controller/login_controller.dart';
import 'package:test_task/Features/Authentication/widgets/custom_button.dart';
import 'package:test_task/Features/Authentication/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  LoginScreen({super.key, required this.userName, required this.userEmail});
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
                          'Log in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
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
                                      ListTile(
                                        leading: const CircleAvatar(
                                          backgroundColor: AppColors.green,
                                        ),
                                        title: Text(
                                          userName,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        subtitle: Text(
                                          userEmail,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      InputField(
                                        passwordField: true,
                                        labelText: 'Password',
                                        onChanged: (value) {
                                          loginController.password = value;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Obx(
                                        () => CustomButton(
                                          text: 'Continue',
                                          isLoading:
                                              loginController.isLoading.value,
                                          height: 50,
                                          backgroundColor: AppColors.green,
                                          borderColor: AppColors.green,
                                          textColor: Colors.white,
                                          onPressed: () async {
                                            await loginController.loogin();
                                          },
                                          textfontSize: 15,
                                        ),
                                      ),
                                      const Spacer(),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Forget Password?',
                                            style: TextStyle(
                                              color: AppColors.green,
                                            ),
                                          )),
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
