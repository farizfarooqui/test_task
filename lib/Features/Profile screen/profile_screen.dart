import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/Constant/app_colors.dart';
import 'package:test_task/Features/Authentication/auth_controller/signup_controller.dart';
import 'package:test_task/Features/Authentication/landing_screen.dart';
import 'package:test_task/Features/Authentication/widgets/personal_details_widget.dart';
import 'package:test_task/Features/Authentication/widgets/tile_widget.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  ProfileScreen({super.key, required this.userName, required this.userEmail});
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
            const SizedBox(
              height: 24,
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    signController.signOut();
                    Get.off(LandingScreen());
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
              userName,
              style: const TextStyle(fontSize: 20, color: AppColors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              userEmail,
              style: const TextStyle(color: AppColors.white),
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
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    PersonalDetailsWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileTileWidget(
                      text: 'Change Password',
                      icon: Icon(Icons.lock, color: AppColors.white),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    ProfileTileWidget(
                      text: 'My Orders',
                      icon: Icon(
                        Icons.shopping_bag,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    ProfileTileWidget(
                      text: 'Chats',
                      icon: Icon(
                        Icons.message,
                        color: AppColors.white,
                      ),
                    ),
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
