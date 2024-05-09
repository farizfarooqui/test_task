import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:test_task/Constant/app_colors.dart';
import 'package:test_task/Features/Authentication/widgets/custom_button.dart';

// ignore: must_be_immutable
class SignScreen extends StatelessWidget {
  SignScreen({super.key});
  TextEditingController passController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

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
                                      const Text(
                                        'farizfarooqui104@gmail.com',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      const Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: _focusNode.hasFocus
                                                    ? AppColors.green
                                                    : Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextFormField(
                                          focusNode: _focusNode,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          obscureText: true,
                                          decoration: const InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            contentPadding:
                                                EdgeInsets.only(left: 15),
                                            border: InputBorder.none,
                                            labelText: "Name",
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: _focusNode.hasFocus
                                                    ? AppColors.green
                                                    : Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextFormField(
                                          focusNode: _focusNode,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            suffixIcon: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'View',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(left: 15),
                                            border: InputBorder.none,
                                            labelText: "Password",
                                            labelStyle: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
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
                                      CustomButton(
                                          text: 'Agree and Continue',
                                          height: 60,
                                          backgroundColor: AppColors.green,
                                          borderColor: AppColors.green,
                                          textColor: Colors.white,
                                          onPressed: () {},
                                          textfontSize: 20),
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
