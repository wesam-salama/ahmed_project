import 'dart:io';

import 'package:digital_academy/model/lesson.dart';
import 'package:digital_academy/model/user_profile_model.dart';
import 'package:digital_academy/screens/uitls/custom_dialoug.dart';
import 'package:digital_academy/screens/uitls/progress_dialog_utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppGet extends GetxController {
  var pr = ProgressDialogUtils.createProgressDialog(Get.context);

  var mapProfile = UserProfile().obs;

  var editingMode = false.obs;

  List<ListCourses> listCourses = [];
  setNewList(List<ListCourses> listCourses) {
    // this.listCourses.clear();
    this.listCourses = listCourses;
    print(this.listCourses.length);
    print(listCourses.length);
    update();
  }

  File file;
  setNewFile(File file) {
    this.file = file;
    update();
  }

  pickImage() async {
    try {
      final pickedFile =
          await ImagePicker.pickImage(source: ImageSource.camera);
      setNewFile(File(pickedFile.path));
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      getSheetError('حدث خطأ');
    }
  }
}
