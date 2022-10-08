import 'dart:convert';
import 'dart:developer';

import 'package:api_integration/controller/general_controller.dart';
import 'package:api_integration/modules/getApi/posts/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

postsRepo(
    ///-----Array has no name in responce
    BuildContext context, bool responseCheck, List response) {
  if (responseCheck) {
    Get.find<PostsLogic>().posts = response;
    Get.find<PostsLogic>().update();
    Get.find<GeneralController>().updateFormLoader(false);
  } else if (!responseCheck) {
    Get.find<GeneralController>().updateFormLoader(false);
    Get.snackbar(
      'Try Again',
      '',
      colorText: Colors.white,
      backgroundColor: Colors.teal.withOpacity(0.7),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(15),
    );
    log('Exception........................');
  }
}
