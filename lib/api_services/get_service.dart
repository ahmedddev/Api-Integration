import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:api_integration/api_services/header.dart';
import 'package:api_integration/controller/general_controller.dart';
import 'package:dio/dio.dart' as dio_instance;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getMethod(
    BuildContext context,
    String apiUrl,
    dynamic queryData,
    bool addAuthHeader,
    Function executionMethod // for performing functionalities
    ) async {
  dio_instance.Response response;
  dio_instance.Dio dio = dio_instance.Dio();

  if (addAuthHeader &&
      Get.find<GeneralController>().boxStorage.hasData('authToken')) {
    setCustomHeader(dio, 'Authorization',
        'Bearer ${Get.find<GeneralController>().boxStorage.read('authToken')}');
  }

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      log('Internet Connected');
      try {
        response = await dio.get(apiUrl, queryParameters: queryData);



        if (response.statusCode == 200) {
          log('StatusCode------>> ${response.statusCode}');
          // log('Response $apiUrl------>> ${response.data}');
          //
          // Map<String, dynamic> data = response.data;
          // executionMethod(context, true, data);
          log('Response $apiUrl------>> ${response.data}');
          // List bodyDecode = jsonDecode(response.data);

          executionMethod(context, true, response.data);
        } else {
          log('StatusCode------>> ${response.statusCode}');
          log('Response $apiUrl------>> $response');
          executionMethod(context, false, {'status': null});
        }
      } on dio_instance.DioError catch (e) {
        executionMethod(context, false, {'status': null});

        if (e.response != null) {
          log('Dio Error From Get $apiUrl -->> ${e.response!}');
        } else {
          log('Dio Error From Get $apiUrl -->> $e');
        }
      }
    }
  } on SocketException catch (_) {
    Get.find<GeneralController>().updateFormLoader(false);
    log('Internet Not Connected');
  }
}
