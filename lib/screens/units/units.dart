import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/SubjectOfUnits.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/units/lessonCard.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/units/lessonsTerm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class UnitsScreen extends StatelessWidget {
  String id;
  String term;
  UnitsScreen(this.id, this.term);
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
            'الدروس',
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
        body: FutureBuilder<SubjectOfUnit>(
          future: Server.server.getSubjectOfUnits(id, term),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataUnits> unit = snapshot.data.units.data;
              return ListView.builder(
                itemCount: unit.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return LessonCard(
                    image: 'assets/images/book.jpg',
                    text1: unit[index].name.toString(),
                    onPressed: () {
                      Get.to(LessonsTerm(unit[index].id.toString()));
                    },
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
