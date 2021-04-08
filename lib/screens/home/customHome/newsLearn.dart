import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/news.dart';
import 'package:digital_academy/screens/home/customHome/newsDeatils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowNews extends StatelessWidget {
  const ShowNews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // width: 150,
      child: new FutureBuilder<News>(
        future: Server.server.getNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DataNews> news = snapshot.data.data;
            return ListView.builder(
              itemCount: news.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(NewsDeatils(news[index].id.toString()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
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
                            color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        news[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Text(news[index].published),
                                      SizedBox(width: 10),
                                      Icon(Icons.date_range_sharp),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Text('المزيد'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
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
    );
  }
}
