import 'package:digital_academy/backend/appGet.dart';
import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/myExamModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyExam extends StatelessWidget {
  AppGet appget = Get.find();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new FutureBuilder<MyExams>(
              future: Server.server.getMyExam(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DataMyExams> myExam = snapshot.data.data.data;
                  return ListView.builder(
                    itemCount: myExam.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400,
                          child: Table(
                            border: TableBorder.all(),
                            columnWidths: {
                              0: IntrinsicColumnWidth(),
                              1: FlexColumnWidth(),
                              2: FixedColumnWidth(64),
                            },
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    // width: 180,
                                    child: Center(
                                      child: Text(myExam[index].id.toString()),
                                    ),
                                  ),
                                  TableCell(
                                    //    verticalAlignment: TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                          child: Text(
                                        '#',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 180,
                                    child: Center(
                                      child: Text(
                                        appget.mapProfile.value.educationalLevel
                                            .name,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'المرحلة التعليمية',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 180,
                                    child: Center(
                                      child: Text(
                                        appget.mapProfile.value.educationalGrade
                                            .name,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          ' الصف الدراسي',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 180,
                                    child: Center(
                                      child: Text(
                                        myExam[index].subject.name,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'المادة الدراسية',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 180,
                                    child: Center(
                                      child: Text(myExam[index].name),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'الامتحان',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 180,
                                    child: Center(
                                      child: Text(
                                        myExam[index].questionsCount.toString(),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'عدد الاسسئلة',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 180,
                                    child: Center(
                                      child: Text(
                                        myExam[index].examDegrees.toString(),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'درجة الامتحان',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 180,
                                    child: Center(
                                      child: Text(
                                        myExam[index]
                                            .answeredQuestions
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'درجة الطالب',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 180,
                                    child: Center(
                                      child: Text(myExam[index].status),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'حالة الامتحان',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 180,
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.remove_red_eye),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.top,
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                        child: Text(
                                          'عرض الامتحان',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  //  return snapshot.error;
                }
                return new Center(
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                          padding: new EdgeInsets.only(right: 20, top: 30)),
                      new CircularProgressIndicator(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
