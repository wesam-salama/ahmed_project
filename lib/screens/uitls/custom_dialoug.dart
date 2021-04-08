import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

getSheetError(String title) {
  return Get.snackbar(
    '',
    '',
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
        ),
        SizedBox(
          width: ScreenUtil().setWidth(10),
        ),
        Icon(
          Icons.info,
          color: Colors.red,
        ),
      ],
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.white,
  );
}

getSheetSucsses(String title) {
  return Get.snackbar('', '',
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Icon(
            Icons.check,
            color: Colors.orange,
          ),
        ],
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white);
}

loading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
