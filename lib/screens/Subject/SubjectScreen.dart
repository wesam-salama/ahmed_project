import 'package:digital_academy/screens/exams/examsTerm.dart';
import 'package:digital_academy/screens/units/unitTerm.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/uitls/cutsomTerminal.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SubjectScreen extends StatelessWidget {
  String id;
  SubjectScreen(this.id);
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
            'صفحة المادة',
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
                text: 'الدروس',
                onClick: () {
                  Get.to(UnitsTerm(id));
                },
              ),
              SizedBox(
                height: (20),
              ),
              CustonTerminal(
                text: 'الامتحانات',
                onClick: () {
                  Get.to(ExamScreen(id));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
