import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  // ignore: non_constant_identifier_names
  String default_choice = '99';
  // ignore: non_constant_identifier_names
  int default_index = 0;
  List<MyChoice> choices = [
    MyChoice(index: 0, chioce: '99'),
    MyChoice(index: 2, chioce: '88'),
    MyChoice(index: 3, chioce: '77'),
    MyChoice(index: 4, chioce: '101'),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: choices
                    .map(
                      (data) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${data.chioce}',
                          ),
                          Spacer(),
                          Expanded(
                            child: RadioListTile(
                              groupValue: default_index,
                              value: data.index,
                              onChanged: (value) {
                                setState(() {
                                  default_choice = data.chioce;
                                  default_index = data.index;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyChoice {
  String chioce;
  int index;
  MyChoice({this.chioce, this.index});
}
