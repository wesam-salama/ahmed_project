import 'package:digital_academy/model/subjectModel.dart';
import 'package:digital_academy/screens/AllSubjectScreen/customContainer.dart';
import 'package:digital_academy/screens/Subject/SubjectScreen.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:digital_academy/backend/server.dart';

// ignore: must_be_immutable
class AllSubjectsScreen extends StatelessWidget {
  String id;
  AllSubjectsScreen(this.id);

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
            ' صفحة المواد',
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
        body: FutureBuilder<SubjectsModel>(
          future: Server.server.getSubject(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<SubjectsData> subject = snapshot.data.subjects;
              return ListView.builder(
                itemCount: subject.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CustomContainer(
                    color: primeryColor,
                    text: subject[index].name,
                    onPress: () {
                      Get.to(SubjectScreen(subject[index].id.toString()));
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
