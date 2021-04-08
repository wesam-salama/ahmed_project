import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/examModel.dart';
import 'package:digital_academy/screens/exams/ScreenTheExam/cardExam.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Exam extends StatelessWidget {
  String id;
  Exam(this.id);
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
            ' Digital Academy',
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
          padding: EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 30),
          child: FutureBuilder<Exams>(
            future: Server.server.getQuestion(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Questions> questions = snapshot.data.questions;

                return ListView.builder(
                  itemCount: questions.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return CardExam(
                      numnberOfQuestion: 'س ${index + 1}',
                      question: questions[index].question,
                      markOfQuestion: '${questions[index].total}',
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return snapshot.error;
              }
              return new Center(
                child: new Column(
                  children: <Widget>[
                    new Padding(
                        padding: new EdgeInsets.only(right: 20, top: 30)),
                    new CircularProgressIndicator(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
