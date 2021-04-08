import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/teachers.dart';
import 'package:flutter/material.dart';

class TeacherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: new ListView(
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          new FutureBuilder<Teachers>(
            future:Server.server. getTeachers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DataTeachers> teacher = snapshot.data.data;
                return new Row(
                    children: teacher
                        .map(
                          (teacher) => Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(teacher.image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              height: 230,
                              width: 150,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Container(
                                    height: 70,
                                    width: 150,
                                    color: Colors.white54,
                                    child: Column(
                                      children: [
                                        Text(
                                          teacher.name,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          teacher.subject,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList());
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
        ],
      ),
    );
  }
}
