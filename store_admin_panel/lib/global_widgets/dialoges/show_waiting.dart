import 'package:flutter/material.dart';
import 'package:get/get.dart';

showWaiting() {
  Get.dialog(const Center(
      child: SizedBox(
          height: 100, width: 100, child: CircularProgressIndicator())));
}
