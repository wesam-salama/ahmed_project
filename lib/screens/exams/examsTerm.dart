import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/uitls/cutsomTerminal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ExamsScreen.dart';

// ignore: must_be_immutable
class ExamScreen extends StatelessWidget {
  String id;
  ExamScreen(this.id);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: primeryColor),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'صفحة الامتحانات',
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
                  Get.back();
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              CustonTerminal(
                text: 'الترم الاول',
                onClick: () {
                  Get.to(ExamTermScreen(id, "1"));
                },
              ),
              SizedBox(
                height: (20),
              ),
              CustonTerminal(
                text: 'الترم الثاني',
                onClick: () {
                  Get.to(ExamTermScreen(id, "2"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
