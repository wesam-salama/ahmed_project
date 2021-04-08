import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/news.dart';
import 'package:digital_academy/screens/home/customHome/newsDeatils.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Menu(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: primeryColor),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'الأخبار',
            style: GoogleFonts.roboto(
                fontSize: 18, color: primeryColor, fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new FutureBuilder<News>(
            future: Server.server.getNews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DataNews> news = snapshot.data.data;
                return ListView.builder(
                  itemCount: news.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        //    width: 300,
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: primeryColor),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              news[index].image,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              height: 60,
                              //  width: 300,
                              color: Colors.black87,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          news[index].title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          news[index].published,
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(NewsDeatils(
                                          news[index].id.toString()));
                                    },
                                    child: Text(
                                      'عرض المزيد',
                                      style: TextStyle(
                                          color: primeryColor, fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                            ),
                          ],
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
    );
  }
}
