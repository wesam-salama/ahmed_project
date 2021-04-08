import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/educationLevel.dart';
import 'package:digital_academy/screens/gradeEdcation/gardeScreen.dart';
import 'package:digital_academy/screens/home/customHome/levelContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LevelHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 150,
      child: new FutureBuilder<LevelEducation>(
        future:Server.server. getLevel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DataLevel> level = snapshot.data.data;
            return ListView.builder(
              itemCount: level.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return LevelContiner(
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
    );
  }
}
