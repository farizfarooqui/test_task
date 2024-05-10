import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_task/Constant/app_colors.dart';
import 'package:test_task/Features/Authentication/auth_controller/login_controller.dart';
import 'package:test_task/Features/Authentication/auth_controller/signup_controller.dart';

class ProfileScreen extends StatelessWidget {
   final String userName;
  final String userEmail;

  ProfileScreen({super.key, required this.userName, required this.userEmail});

  // final user = FirebaseAuth.instance.currentUser!.email;
  final controller = Get.put(SignUpController());
  final signController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.green, Colors.black, Colors.black],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                  )),
              title: const Text(
                'Profile',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  )),
            ),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              signController.name,
              style: TextStyle(fontSize: 20, color: AppColors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              signController.email,
              style: TextStyle(color: AppColors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 24,
                  right: 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 15, 214, 158),
                              Colors.black87,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Email',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                Spacer(),
                                Text(
                                  'fariizfarooqui104@gmail.com',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Date of Birth',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                Spacer(),
                                Text(
                                  '02.11.2002',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Gender',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                Spacer(),
                                Text(
                                  'Male',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                          const SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Phone',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                Spacer(),
                                Text(
                                  '03133017289',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.green,
                              Colors.black87,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: const ListTile(
                        title: Text(
                          'Change Password',
                          style: TextStyle(color: AppColors.white),
                        ),
                        trailing: Icon(
                          Icons.lock,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.green,
                              Colors.black87,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: const ListTile(
                        title: Text(
                          'My Orders',
                          style: TextStyle(color: AppColors.white),
                        ),
                        trailing: Icon(
                          Icons.shopping_bag,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.green,
                              Colors.black87,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: const ListTile(
                        title: Text(
                          'Chats',
                          style: TextStyle(color: AppColors.white),
                        ),
                        trailing: Icon(
                          Icons.message,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
