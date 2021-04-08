import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LessonCard extends StatelessWidget {
  String text1;
  String image;
  Function onPressed;
  LessonCard({this.text1, this.image, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(text1),
                  Spacer(),
                  Text('شاهد الدروس'),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
