import 'package:digital_academy/screens/exams/ScreenTheExam/radioGroup.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExamDialog extends StatefulWidget {
  String text;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ExamDialog> {
  final _formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              ' ضع اجابتك على السؤال',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 2,
              width: 900,
              color: Colors.blue,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'كم عددأسماء الله الحسنى',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'اختر الإجابة الصحيحة',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: RadioGroup(),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: primeryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                      child: Text(
                        'إرسال الإجابة ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
