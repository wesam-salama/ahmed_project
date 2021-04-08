import 'package:digital_academy/backend/appGet.dart';
import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class GetOrderScreen extends StatelessWidget {
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
            child: new FutureBuilder<Order>(
              future: Server.server.getOrder(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DataOrder> order = snapshot.data.data;
                  return ListView.builder(
                    itemCount: order.length,
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
                                    child: Center(
                                      child: Text(appget.mapProfile.value
                                          .educationalLevel.name),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      height: 32,
                                      width: 150,
                                      child: Center(
                                          child: Text(
                                        'المرحلة التعليمية',
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
                                          'الصف الدراسي',
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
                                        order[index].startDate,
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
                                          'بداية الاشتراك',
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
                                      child: Text(order[index].endDate),
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
                                          'نهاية الاشتراك',
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
                                      child: Text(order[index].status),
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
                                          'الحالة',
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
                                          'التفاصيل',
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
