import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardClassRoom extends StatelessWidget {
  String textTitle;
  String textStartDateRoom;
  String classTime;
  String time;
  Function onPressed;
  CardClassRoom(
      {this.textTitle,
      this.textStartDateRoom,
      this.classTime,
      this.time,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    textTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'تاريخ بداية الفصل : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(textStartDateRoom),
                ],
              ),
              Row(
                children: [
                  Text(
                    'ميعاد الفصل : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(classTime),
                ],
              ),
              Row(
                children: [
                  Text(
                    'المدة : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Text(time),
                ],
              ),
              Row(
                children: [
                  Text(
                    'دخول الفصل',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_back_outlined),
                    onPressed: onPressed,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
