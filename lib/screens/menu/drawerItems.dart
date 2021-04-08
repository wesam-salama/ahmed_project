import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;

  final bool out;
  final Function onTap;

  DrawerItem({@required this.text, this.out = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              color: !out ? Colors.red : Colors.black,
              height: 30,
              width: 5,
            ),
            SizedBox(
              width: 25,
            ),
            Text(text,
                style: TextStyle(
                    fontSize: 22,
                    color: !out ? Color(0xffB80410) : Colors.black45,
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    );
  }
}
