import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/educationLevel.dart';
import 'package:digital_academy/screens/gradeEdcation/gardeScreen.dart';
import 'package:digital_academy/screens/home/homeScreen.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'levelContainer.dart';

class Levels extends StatelessWidget {
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
            ' المراحل التعليمية',
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
                  Get.to(HomeScreen());
                },
              ),
            ),
          ],
        ),
        body: new FutureBuilder<LevelEducation>(
          future: Server.server.getLevel(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataLevel> level = snapshot.data.data;
              return ListView.builder(
                itemCount: level.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return LevelContainer(
                    text: level[index].name.toString(),
                    onClick: () {
                      Get.to(GradeScreen(level[index].id.toString()));
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              //  return snapshot.error;
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
