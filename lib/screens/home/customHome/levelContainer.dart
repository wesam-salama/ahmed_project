import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LevelContiner extends StatelessWidget {
  String text;
  Function onClick;
  LevelContiner({this.text, this.onClick});
  List<BoxShadow> sCardShadow2 = [
    BoxShadow(blurRadius: 12, offset: Offset(2, 6), color: Colors.white),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primeryColor,
        ),
        height: 50,
        width: 120,
        child: GestureDetector(
          onTap: onClick,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
