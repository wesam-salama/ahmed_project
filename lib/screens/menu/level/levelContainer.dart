import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LevelContainer extends StatelessWidget {
  String text;
  Function onClick;
  LevelContainer({this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 40, left: 40),
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 5),
        // ignore: deprecated_member_use
        child: RaisedButton(
          color: primeryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          onPressed: onClick,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
