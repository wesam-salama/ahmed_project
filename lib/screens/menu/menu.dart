import 'package:digital_academy/backend/appGet.dart';
import 'package:digital_academy/screens/home/homeScreen.dart';
import 'package:digital_academy/screens/menu/callUs.dart';
import 'package:digital_academy/screens/menu/classRoom/ClassRoom.dart';
import 'package:digital_academy/screens/menu/level/levels.dart';
import 'package:digital_academy/screens/menu/news.dart';
import 'package:digital_academy/screens/menu/usagePolicy.dart';
import 'package:digital_academy/screens/menu/usageperson.dart';
import 'package:digital_academy/screens/menu/whoAreUs.dart';
import 'package:digital_academy/screens/profile/profileScreen.dart';
import 'package:digital_academy/screens/menu/drawerItems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Menu extends StatelessWidget {
  AppGet appget = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 255,
      child: Drawer(
        elevation: 0,
        child: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Obx(() => appget.mapProfile.value.id == null
                  ? Container()
                  : Center(
                      child: Text(
                        'مرحبا' +
                            "  " +
                            appget.mapProfile.value.name.toString(),
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff707070),
                            fontWeight: FontWeight.w300),
                      ),
                    )),
              SizedBox(
                height: 20,
              ),
              DrawerItem(
                text: 'الرئيسية ',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              DrawerItem(
                text: 'الصفحة الشخصية ',
                onTap: () {
                  Get.to(ProfileScreen());
                },
              ),
              DrawerItem(
                text: 'الحصص الافتراضية',
                onTap: () {
                  Get.to(ClassRoom());
                },
              ),
              DrawerItem(
                text: 'المراحل التعليمية',
                onTap: () {
                  Get.to(Levels());
                },
              ),
              DrawerItem(
                text: 'الاخبار',
                onTap: () {
                  Get.to(NewsScreen());
                },
              ),
              DrawerItem(
                text: 'من نحن',
                onTap: () {
                  Get.to(WhoAreUs());
                },
              ),
              DrawerItem(
                text: 'سياسة الخصوصية',
                onTap: () {
         Get.to( UsagePersson());
                },
              ),
              DrawerItem(
                text: 'سياسة الاستخدام',
                onTap: () {
            Get.to( UsagePolicy());
                },
              ),
              DrawerItem(
                text: 'اتصل بنا',
                onTap: () {
                    Get.to( CallUs());
                },
              ),
              DrawerItem(
                onTap: null,
                text: 'خروج',
                out: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
