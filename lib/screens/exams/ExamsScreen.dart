import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/ExamsListModel.dart';
import 'package:digital_academy/screens/exams/ScreenTheExam/screenTheExam.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ExamTermScreen extends StatelessWidget {
  String id;
  String term;
  ExamTermScreen(this.id, this.term);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: primeryColor),
          elevation: 0,
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
        body: FutureBuilder<ExamsList>(
          future: Server.server.getExams(id, term),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DataExams> exam = snapshot.data.data;
              //  List<Questions> questions = snapshot.data.;

              return ListView.builder(
                itemCount: exam.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 400,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(exam[index].image),
                                  fit: BoxFit.cover,
                                  colorFilter: new ColorFilter.mode(
                                      Colors.red.withOpacity(0.2),
                                      BlendMode.dstATop),
                                ),
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(100),
                                  bottomLeft: Radius.circular(100),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  exam[index].name,
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
                            Text("عدد الأسئلة : " +
                                    "${snapshot.data.data[index].questions.length}"
                                        .toString() //    questions[index].articleAnswer.toString(),
                                ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('درجة الامتحان  :' +
                                '${snapshot.data.data[index].questions.length * 2}'),
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
                                onTap: () {
                                  Get.to(Exam(exam[index].id.toString()));
                                },
                                child: Container(
                                  height: 30,
                                  width: 150,
                                  child: Center(
                                    child: Text(
                                      'بدأ الامتحان  ',
                                      style: TextStyle(
                                          color: primeryColor, fontSize: 12),
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
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return snapshot.error;
            }
            return new Center(
              child: new Column(
                children: <Widget>[
                  new Padding(padding: new EdgeInsets.only(right: 20, top: 30)),
                  new CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
