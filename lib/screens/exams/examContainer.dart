import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExamContainer extends StatelessWidget {
  String text;
  Image image;
  Function onTap;
  ExamContainer({this.text, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("$image"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.red.withOpacity(0.2), BlendMode.dstATop),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('عدد الأسئلة :9'),
            SizedBox(
              height: 10,
            ),
            Text('درجة الامتحان  :18'),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: primeryColor,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 30,
                  width: 150,
                  child: Center(
                    child: Text(
                      'بدأ الامتحان  ',
                      style: TextStyle(color: primeryColor, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
