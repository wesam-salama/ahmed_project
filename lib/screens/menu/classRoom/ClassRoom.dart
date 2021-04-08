import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/classesOnline.dart';
import 'package:digital_academy/screens/menu/classRoom/cardClassRoom.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ClassRoom extends StatelessWidget {
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
            'الحصص الافتراضية',
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
        body: FutureBuilder<ClassesOnline>(
          future: Server.server.getClassOnline(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataClassesOnline> data = snapshot.data.data.data;

              return ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CardClassRoom(
                    textTitle: data[index].roomTitle.toString(),
                    textStartDateRoom: data[index].datetime,
                    classTime: data[index].datetime,
                    time: data[index].time,
                    //  onPressed: () {},
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
