import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/educationGarde.dart';
import 'package:digital_academy/screens/AllSubjectScreen/allSubjectsScreen.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'classlessonContanier.dart';

// ignore: must_be_immutable
class GradeScreen extends StatelessWidget {
  String id;
  GradeScreen(this.id);
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
        body: FutureBuilder<EducationGrade>(
          future: Server.server.getEducationGrade(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataGrade> grade = snapshot.data.data;
              return ListView.builder(
                itemCount: grade.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/backgroud1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Column(
                        children: [
                          ClassLessonConttainr(
                            text1: grade[index].name,
                            text2: grade[index].totalSubjects.toString(),
                            text3: grade[index].totalLessons.toString(),
                            onPress: () {
                              Get.to(AllSubjectsScreen(
                                  grade[index].id.toString()));
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return snapshot.error;
            }
            return new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.only(right: 20, top: 30)),
                  new CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
