import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClassLessonConttainr extends StatelessWidget {
  String text1;
  String text2;
  String text3;
  Function onPress;
  ClassLessonConttainr({this.text1, this.text2, this.text3, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                          color: primeryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      text3,
                      style: TextStyle(
                          color: primeryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 50,
                      width: 50,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: onPress,
                      child: Text(
                        'دخول',
                        style: TextStyle(
                            color: primeryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 5,
              width: 200,
              color: primeryColor,
            ),
          ],
        ),
      ),
    );
  }
}
