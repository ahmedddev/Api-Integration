// import 'dart:developer';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:practice_rehan/lavender/controller/general_controller.dart';
// import 'package:practice_rehan/lavender/modules/bottom_nav_bar/view.dart';
// import 'package:practice_rehan/lavender/modules/login/logic.dart';
// import 'package:practice_rehan/lavender/modules/login/view.dart';
// import 'package:practice_rehan/lavender/modules/sign_up/logic.dart';
// import 'package:practice_rehan/lavender/utils/colors.dart';
//
// class FirebaseAuthentication {
//   void signInWithEmailAndPassword() async {
//     try {
//       final User? user =
//           (await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: Get.find<LoginLogic>().emailController.text,
//         password: Get.find<LoginLogic>().passwordController.text,
//       ))
//               .user;
//       Get.find<GeneralController>().updateFormLoader(false);
//       if (user != null) {
//         log(user.uid.toString());
//         Get.find<GeneralController>()
//             .boxStorage
//             .write('uid', user.uid.toString());
//         log('user exist');
//         Get.find<GeneralController>().boxStorage.write('session', 'active');
//
//         Get.find<GeneralController>().boxStorage.write('loginType', 'email');
//         Get.offAll(const BottomNavBarPage());
//         Get.find<LoginLogic>().emailController.clear();
//         Get.find<LoginLogic>().passwordController.clear();
//       } else {
//         log('user not found');
//         Get.find<GeneralController>().boxStorage.remove('session');
//       }
//     } on FirebaseAuthException catch (e) {
//       Get.find<GeneralController>().updateFormLoader(false);
//       Get.snackbar(
//         e.code,
//         '',
//         colorText: Colors.white,
//         backgroundColor: customThemeColor.withOpacity(0.7),
//         snackPosition: SnackPosition.BOTTOM,
//         margin: const EdgeInsets.all(15),
//       );
//     }
//   }
//
//   Future<bool> signUp() async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: Get.find<SignUpLogic>().emailController.text,
//               password: Get.find<SignUpLogic>().passwordController.text)
//           .then((user) {
//         Get.find<GeneralController>().boxStorage.write('uid', user.user!.uid);
//         FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set({
//           'name': Get.find<SignUpLogic>().nameController.text,
//           'email': Get.find<SignUpLogic>().emailController.text,
//           'uid': user.user!.uid,
//         });
//       });
//       Get.find<GeneralController>().updateFormLoader(false);
//       Get.find<GeneralController>().boxStorage.write('session', 'active');
//       Get.offAll(const BottomNavBarPage());
//
//       Get.find<SignUpLogic>().emailController.clear();
//       Get.find<SignUpLogic>().passwordController.clear();
//       return true;
//     } on FirebaseAuthException catch (e) {
//       Get.find<GeneralController>().updateFormLoader(false);
//       Get.snackbar(
//         e.code,
//         '',
//         colorText: Colors.white,
//         backgroundColor: customThemeColor.withOpacity(0.7),
//         snackPosition: SnackPosition.BOTTOM,
//         margin: const EdgeInsets.all(15),
//       );
//       log(e.toString());
//       return false;
//     }
//   }
//
//   Future signOut() async {
//     await FirebaseAuth.instance.signOut();
//     Get.find<GeneralController>().boxStorage.remove('uid');
//     Get.find<GeneralController>().boxStorage.remove('session');
//     Get.offAll(const LoginPage());
//   }
// }
