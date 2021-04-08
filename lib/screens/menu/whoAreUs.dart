import 'package:digital_academy/screens/home/homeScreen.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhoAreUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: primeryColor),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'من نحن',
            style: GoogleFonts.roboto(
                fontSize: 18, color: primeryColor, fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 300,
              ),
              Container(
                decoration: BoxDecoration(
                  color: primeryColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'أكبر منصة تعليمية في الوطن العربي   فيديوهات تعليمية  (تطبيقات على ما تم شرحة ( واجبات اختبارات الكترونية متابعة مستمرة للطالب من خلال جروب لكل الطلاب المشتركين متابعة ولي الأمر من خلال جروب أولياء الأمور رد على جميع التساؤلات من خلال فريق عمل يقوم بالرد على جميع التساؤلات لقاءات بث مباشر بين المعلم والطلاب المشتركين online للتواصل والرد على الاستفسارات بشكل مباشر   توفير لقاء مباشر بين الطالب والمعلم مع مراعاة الشروط الاحترازية',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
