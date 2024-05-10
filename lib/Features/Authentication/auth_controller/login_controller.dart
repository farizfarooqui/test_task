import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:test_task/Constant/show_toast.dart';
import 'package:test_task/Features/Authentication/login_screen.dart';
import 'package:test_task/Features/Authentication/sign_up_screen.dart';
import 'package:test_task/Features/Profile%20screen/profile_screen.dart';

class LoginController extends GetxController {
  String email = '';
  String password = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;
  RxBool isObsecure = false.obs;

  Future<void> loogin() async {
    try {
      isLoading.value = true;
      log(email);
      log('pass : $password');
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Retrieve user data from Firestore
      DocumentSnapshot<Map<String, dynamic>> userData =
          await FirebaseFirestore.instance.collection('Users').doc(email).get();
      String userName = userData['fullName'];
      String userEmail = userData['email'];

      // Navigate to profile screen with user data
      Get.off(() => ProfileScreen(userName: userName, userEmail: userEmail));
      XHelperFunctions.showToastMessage(message: 'login successful!');
    } catch (e) {
      XHelperFunctions.showToastMessage(message: 'Error: ${e.toString()}');
      log('error: ${e.toString()}');
      isLoading.value = false;
      throw Exception(e);
    }
  }

  Future<void> verifyEmail() async {
    try {
      isLoading.value = true;
      log(email);
      log(password);

      // Check if the email is already in use
      QuerySnapshot<Map<String, dynamic>> existingUsers = await _firestore
          .collection('Users')
          .where('email', isEqualTo: email)
          .get();

      if (existingUsers.docs.isNotEmpty) {
        XHelperFunctions.showToastMessage(message: 'Email already in use');
        Get.off(() => LoginScreen());
        isLoading.value = false;
        return;
      } else {
        XHelperFunctions.showToastMessage(message: 'Create account');
        Get.off(() => SignScreen());
        isLoading.value = false;
      }
    } catch (e) {
      XHelperFunctions.showToastMessage(message: 'Error: ${e.toString()}');
      log('error: ${e.toString()}');
      isLoading.value = false;
      throw Exception(e);
    }
  }
}
