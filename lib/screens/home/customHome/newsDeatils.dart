import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/news_details.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

// ignore: must_be_immutable
class NewsDeatils extends StatelessWidget {
  String id;
  NewsDeatils(this.id);
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
          title: Text(
            'Digital Academy',
            style: GoogleFonts.roboto(
                fontSize: 18, color: primeryColor, fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/images/logo.png',
                height: 70,
                width: 70,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<NewsDetails>(
            future: Server.server.getNewsDetails(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                NewsDetails newsDetails = snapshot.data;

                return ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        //    mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            newsDetails.news.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        top: 10,
                      ),
                      child: Row(
                        //    mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.date_range_sharp),
                          SizedBox(
                            width: 10,
                          ),
                          Text(newsDetails.news.published.toString()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: 500,
                        height: 200,
                        child: Image.network(
                          newsDetails.news.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: HtmlWidget(
                        newsDetails.news.desc.toString(),
                      ),
                    ),
                  ],
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
