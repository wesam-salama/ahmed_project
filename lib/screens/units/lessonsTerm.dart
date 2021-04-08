import 'package:digital_academy/model/unitLesson.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/units/lesson/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:digital_academy/backend/server.dart';

// ignore: must_be_immutable
class LessonsTerm extends StatelessWidget {
  String id;

  LessonsTerm(
    this.id,
  );
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
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<UnitLesson>(
            future: Server.server.getUnitLesson(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DataCourses> dataCourses = snapshot.data.courses.data;
                return ListView.builder(
                  itemCount: dataCourses.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        height: 250,
                        child: Column(
                          children: [
                            Image.network(
                              dataCourses[index].image,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      dataCourses[index].name.toString(),
                                    ),
                                  ),
                                  Spacer(),
                                  Text('شاهد الدرس'),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward),
                                    onPressed: () {
                                      Get.to(LessonScreen(
                                          dataCourses[index].id.toString()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                //  return snapshot.error;
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
