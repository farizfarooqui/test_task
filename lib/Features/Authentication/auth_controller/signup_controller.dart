import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_task/Constant/show_toast.dart';
import 'package:test_task/Features/Authentication/auth_controller/login_controller.dart';
import 'package:test_task/Features/Profile%20screen/profile_screen.dart';

class SignUpController extends GetxController {
  String email = Get.find<LoginController>().email;
  String password = '';
  String name = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  // Intance of firebasefirestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;
  RxBool isObsecure = false.obs;

  Future<void> signUp() async {
    try {
      isLoading.value = true;
      log(email);
      log(password);
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //storing data in firebase
      _firestore.collection('Users').doc(email).set(
        {
          'email': email,
          'fullName': name,
        },
      );
      DocumentSnapshot<Map<String, dynamic>> userData =
          await FirebaseFirestore.instance.collection('Users').doc(email).get();
      String userName = userData['fullName'];
      String userEmail = userData['email'];

      Get.off(() => ProfileScreen(userName: userName, userEmail: userEmail));
      XHelperFunctions.showToastMessage(message: 'Signup successfully !');
    } catch (e) {
      XHelperFunctions.showToastMessage(message: 'Error: ${e.toString()}');
      log('error: ${e.toString()}');
      isLoading.value = false;
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    Get.find<LoginController>().email = '';
    Get.find<LoginController>().password = '';
    Get.find<LoginController>().email = '';
    Get.find<SignUpController>().password = '';
    Get.find<SignUpController>().isLoading.value = false;
    Get.find<LoginController>().isLoading.value = false;
  }
}
