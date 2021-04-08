import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustonTerminal extends StatelessWidget {
  String text;
  Function onClick;
  CustonTerminal({this.text, this.onClick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
