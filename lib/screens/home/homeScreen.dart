import 'package:digital_academy/screens/home/customHome/customTeacher.dart';
import 'package:digital_academy/screens/home/customHome/newsLearn.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'customHome/hedarHome.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle myTextStyle = TextStyle(
      fontSize: 22, color: Color(0xffB80410), fontWeight: FontWeight.w300);

  List<BoxShadow> sCardShadow2 = [
    BoxShadow(blurRadius: 12, offset: Offset(2, 6), color: Colors.grey.shade50),
  ];

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
            'Digital Academy',
            style: GoogleFonts.roboto(
                fontSize: 18, color: primeryColor, fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/images/logo.png',
                height: 70,
                width: 70,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                children: [
                  Text(
                    'المراحل التعليمية',
                    style: myTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              LevelHome(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'الأخبار التعليمية',
                    style: myTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ShowNews(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'معلمين اصحاب أعلى تقيم',
                      style: myTextStyle,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TeacherScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
