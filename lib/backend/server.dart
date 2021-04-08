import 'dart:convert';
import 'dart:io';

import 'package:digital_academy/backend/appGet.dart';
import 'package:digital_academy/backend/sp_helper.dart';
import 'package:digital_academy/model/ExamsListModel.dart';
import 'package:digital_academy/model/SubjectOfUnits.dart';
import 'package:digital_academy/model/classesOnline.dart';
import 'package:digital_academy/model/classesOnlineId.dart';
import 'package:digital_academy/model/educationDivison.dart';
import 'package:digital_academy/model/educationGarde.dart';
import 'package:digital_academy/model/educationLevel.dart';
import 'package:digital_academy/model/examModel.dart';
import 'package:digital_academy/model/lesson.dart';
import 'package:digital_academy/model/myExamModel.dart';
import 'package:digital_academy/model/order.dart';
import 'package:digital_academy/model/unitLesson.dart';
import 'package:digital_academy/model/news.dart';
import 'package:digital_academy/model/news_details.dart';
import 'package:digital_academy/model/subjectModel.dart';
import 'package:digital_academy/model/teachers.dart';
import 'package:digital_academy/model/user_profile_model.dart';
import 'package:digital_academy/screens/home/homeScreen.dart';

import 'package:digital_academy/screens/uitls/custom_dialoug.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;
import 'package:get/get.dart' as myget;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class Server {
  Server._();
  static Server server = Server._();
  AppGet appGet = myGet.Get.find();

  String baseUrl = 'https://test.digitalacadmy.com/api';

  Dio dio;

  initDio() {
    if (dio == null) {
      return dio = Dio();
    }
    return dio;
  }

  register(
    String email,
    String password,
    String passwordConfirmation,
    String name,
    String address,
    String educationaLevelId,
    String educationaGradeId,
    String phone, [
    String division,
    File image,
  ]) async {
    appGet.pr.show();

    try {
      initDio();
      FormData data = division == null
          ? FormData.fromMap(
              {
                'name': name,
                'email': email,
                'password': password,
                'password_confirmation': passwordConfirmation,
                'educationa_level_id': educationaLevelId,
                'educationa_grade_id': educationaGradeId,
                'address': address,
                'phone': phone,
                'image': await MultipartFile.fromFile(
                  image.path,
                  filename: basename(image.path),
                  contentType: MediaType("image", "jpg"),
                ),
              },
            )
          : FormData.fromMap(
              {
                'name': name,
                'email': email,
                'password': password,
                'password_confirmation': passwordConfirmation,
                'educationa_level_id': educationaLevelId,
                'educationa_grade_id': educationaGradeId,
                'address': address,
                'division': division,
                'phone': phone,
                'image': await MultipartFile.fromFile(
                  image.path,
                  filename: basename(image.path),
                  contentType: MediaType("image", "jpg"),
                ),
              },
            );

      Response response = await dio.post(
        baseUrl + '/auth/register',
        data: data,
      );
      Map map = response.data;
      print('Mappppp $map');
      if (map.containsKey('token')) {
        appGet.pr.hide();

        SPHelper.spHelper.setToken(map['token']);
        getSheetSucsses('تم إنشاء حساب');
        myGet.Get.to(() => HomeScreen());
      } else {
        appGet.pr.hide();
        getSheetError('البيانات  موجودة');
      }
    } catch (e) {
      appGet.pr.hide();
      print(e);
      getSheetError('البيانات موجودة');
    }
  }

  updateProfile(
    String email,
    String password,
    String passwordConfirmation,
    String name,
    String address,
    String educationaLevelId,
    String educationaGradeId,
    String division,
    String phone,
    File image,
  ) async {
    appGet.pr.show();

    try {
      initDio();
      FormData data = division == null
          ? FormData.fromMap(
              {
                'name': name,
                'email': email,
                'password': password,
                'password_confirmation': passwordConfirmation,
                'educationa_level_id': educationaLevelId,
                'educationa_grade_id': educationaGradeId,
                'address': address,
                'phone': phone,
                'image': await MultipartFile.fromFile(
                  image.path,
                  filename: basename(image.path),
                  contentType: MediaType("image", "jpg"),
                ),
              },
            )
          : FormData.fromMap(
              {
                'name': name,
                'email': email,
                'password': password,
                'password_confirmation': passwordConfirmation,
                'educationa_level_id': educationaLevelId,
                'educationa_grade_id': educationaGradeId,
                'address': address,
                'division': division,
                'phone': phone,
                'image': await MultipartFile.fromFile(
                  image.path,
                  filename: basename(image.path),
                  contentType: MediaType("image", "jpg"),
                ),
              },
            );

      Response response = await dio.post(
        baseUrl + '/auth/user/update',
        data: data,
      );
      Map map = response.data;
      if (map.containsKey('token')) {
        appGet.pr.hide();

        SPHelper.spHelper.setToken(map['token']);
        getSheetSucsses('تم تعديل البيانات');
        myGet.Get.to(() => HomeScreen());
      } else {
        appGet.pr.hide();
        getSheetError('البيانات موجودة');
      }
    } catch (e) {
      appGet.pr.hide();
      print(e);
      getSheetError('البيانات موجودة');
    }
  }

  login(String email, String password) async {
    appGet.pr.show();

    try {
      initDio();
      FormData data = FormData.fromMap(
        {
          'email': email,
          'password': password,
        },
      );
      Response response = await dio.post(
        baseUrl + '/auth/login',
        data: data,
      );
      Map map = response.data;
      print('Mappppp $map');
      if (map.containsKey('token')) {
        appGet.pr.hide();

        SPHelper.spHelper.setToken(map['token']);
        getSheetSucsses('تم تسجيل الدخول');
        myGet.Get.to(() => HomeScreen());
      } else {
        appGet.pr.hide();

        getSheetError('البيانات خاطئة');
      }
    } catch (e) {
      appGet.pr.hide();
      print(e);
      getSheetError('البيانات خاطئة');
    }
  }

  getProfile() async {
    String token = SPHelper.spHelper.getToken();
    try {
      initDio();

      Response response = await dio.get(
        baseUrl + '/auth/user/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      Map map = response.data;
      //  print('Mappppp $map');
      UserProfile userProfile = UserProfile.fromJson(map);
      appGet.mapProfile.value = userProfile;
    } catch (e) {
      print(e);
    }
  }

  Future<LevelEducation> getLevel() async {
    final http.Response response =
        await http.get(baseUrl + '/education_levels', headers: {
      'Accept': 'application/json',
    });
    var responseJson = json.decode(response.body);
    LevelEducation levelEducation = LevelEducation.fromJson(responseJson);
    return levelEducation;
  }

  Future<EducationGrade> getEducationGrade(String id) async {
    final http.Response response =
        await http.get(baseUrl + '/education_grade/$id', headers: {
      'Accept': 'application/json',
    });
    var responseJson = json.decode(response.body);
    EducationGrade educationGrade = EducationGrade.fromJson(responseJson);
    return educationGrade;
  }

  Future<EducationDivison> geteducationDivison(String id) async {
    final http.Response response =
        await http.get(baseUrl + '/education_divison/$id', headers: {
      'Accept': 'application/json',
    });
    var responseJson = json.decode(response.body);

    return EducationDivison.fromJson(responseJson);
  }

  Future<News> getNews() async {
    final http.Response response = await http.get(baseUrl + '/news', headers: {
      'Accept': 'application/json',
    });
    var responseJson = json.decode(response.body);

    News news = News.fromJson(responseJson['news']);

    return news;
  }

  Future<NewsDetails> getNewsDetails(String id) async {
    final http.Response response =
        await http.get(baseUrl + '/news/$id', headers: {
      'Accept': 'application/json',
    });
    var responseJson = json.decode(response.body);
    NewsDetails news = NewsDetails.fromJson(responseJson);

    return news;
  }

  Future<SubjectsModel> getSubject(String id) async {
    final http.Response response =
        await http.get(baseUrl + '/get_education_subjects/$id', headers: {
      'Accept': 'application/json',
    });
    var responseJson = json.decode(response.body);
    SubjectsModel subjectsModel = SubjectsModel.fromJson(responseJson);
    return subjectsModel;
  }

  Future<Teachers> getTeachers() async {
    final http.Response response =
        await http.get(baseUrl + '/teachers', headers: {
      'Accept': 'application/json',
    });
    var responseJson = json.decode(response.body);

    Teachers teacher = Teachers.fromJson(responseJson['teachers']);

    return teacher;
  }

  Future<SubjectOfUnit> getSubjectOfUnits(String id, String term) async {
    final http.Response response =
        await http.get(baseUrl + '/get_education_units/$id/$term', headers: {
      'Accept': 'application/json',
    });

    var responseJson = json.decode(response.body);
    SubjectOfUnit subjectOfUnits2 = SubjectOfUnit.fromJson(responseJson);
    return subjectOfUnits2;
  }

// ignore: missing_return
  Future<UnitLesson> getUnitLesson(String id) async {
    final http.Response response =
        await http.get(baseUrl + '/get_education_lessons/$id', headers: {
      'Accept': 'application/json',
    });
    var responseJson = json.decode(response.body);
    UnitLesson unitLesson = UnitLesson.fromJson(responseJson);
    return unitLesson;
  }

  Future<Lesson> getLesson(String id) async {
    String token = SPHelper.spHelper.getToken();
    final http.Response response =
        await http.get(baseUrl + '/get_education_course/$id', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var responseJson = json.decode(response.body);
    print(responseJson);
    Lesson lesson = Lesson.fromJson(responseJson);
    return lesson;
  }

  Future<ExamsList> getExams(String id, String term) async {
    String token = SPHelper.spHelper.getToken();
    final http.Response response =
        await http.get(baseUrl + '/exams/$id/$term', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var responseJson = json.decode(response.body);
    print(responseJson);
    ExamsList exams = ExamsList.fromJson(responseJson);
    //print(exams);
    return exams;
  }

  Future<Exams> getQuestion(String id) async {
    String token = SPHelper.spHelper.getToken();
    final http.Response response =
        await http.get(baseUrl + '/exam/$id', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var responseJson = json.decode(response.body);
    Exams question = Exams.fromJson(responseJson);
    return question;
  }

  Future<MyExams> getMyExam() async {
    String token = SPHelper.spHelper.getToken();
    final http.Response response =
        await http.get(baseUrl + '/my-exams', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var responseJson = json.decode(response.body);
    // print(responseJson);
    MyExams myExam = MyExams.fromJson(responseJson);
    return myExam;
  }

  Future<ClassesOnline> getClassOnline() async {
    String token = SPHelper.spHelper.getToken();
    final http.Response response =
        await http.get(baseUrl + '/online/classes', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var responseJson = json.decode(response.body);
    // print(responseJson);
    ClassesOnline classesOnline = ClassesOnline.fromJson(responseJson);
    return classesOnline;
  }

  Future<ClassesOnlineId> getClassOnlineId(String id) async {
    String token = SPHelper.spHelper.getToken();
    final http.Response response =
        await http.get(baseUrl + '/online/classes/$id', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var responseJson = json.decode(response.body);
    // print(responseJson);
    ClassesOnlineId classesOnlineId = ClassesOnlineId.fromJson(responseJson);
    //  print(classesOnlineId);

    return classesOnlineId;
  }

  Future<Order> getOrder() async {
    String token = SPHelper.spHelper.getToken();
    final http.Response response =
        await http.get(baseUrl + '/orders', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var responseJson = json.decode(response.body);
    // print(responseJson);
    Order order = Order.fromJson(responseJson);
    //  print(classesOnlineId);

    return order;
  }

  addComment(String comment, String courseId) async {
    appGet.pr.show();

    try {
      initDio();
      FormData data = FormData.fromMap(
        {
          'comment': comment,
          'course_id': courseId,
        },
      );
      Response response = await dio.post(
        baseUrl + '/add_comment/lesson',
        data: data,
      );
      Map map = response.data;
      print('Mappppp $map');
      if (map.containsKey('token')) {
        appGet.pr.hide();

        SPHelper.spHelper.setToken(map['token']);
        getSheetSucsses('تم التعليق');
        // myGet.Get.to(() => HomeScreen());
      } else {
        appGet.pr.hide();

        // getSheetError('البيانات خاطئة');
      }
    } catch (e) {
      appGet.pr.hide();
      print(e);
      getSheetError('البيانات خاطئة');
    }
  }

  searchCourse(String courseName, String courseId) async {
    appGet.pr.show();
    String token = SPHelper.spHelper.getToken();

    try {
      initDio();
      FormData data = FormData.fromMap(
        {
          'course_name': courseName,
          'course_id': courseId,
        },
      );
      Response response = await dio.post(
        baseUrl + '/search/lesson',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      Map map = response.data;
      var list = map['courses_list'] as List;
      List<ListCourses> listCourses =
          list.map((e) => ListCourses.fromJson(e)).toList();
      appGet.setNewList(listCourses);
      // print('Mappppp ${listCourses.first.image}');

      // if (map.containsKey('token')) {
      //   appGet.pr.hide();

      //   SPHelper.spHelper.setToken(map['token']);
      //   getSheetSucsses('تم التعليق');
      //   // myGet.Get.to(() => HomeScreen());
      // } else {
      appGet.pr.hide();
      print('done');
      //   // getSheetError('البيانات خاطئة');
      // }
    } catch (e) {
      appGet.pr.hide();
      print(e);
      getSheetError('الرجاء ادخال بيانات');
    }
  }
}
