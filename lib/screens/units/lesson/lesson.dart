import 'package:digital_academy/backend/appGet.dart';
import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/model/lesson.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:digital_academy/screens/units/video_Item.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class LessonScreen extends StatefulWidget {
  String id;
  LessonScreen(this.id);

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
//  List<Lessons> video = List<Lessons>;
  TextEditingController _searchController = TextEditingController();
  TextEditingController _commentController = TextEditingController();
  WebViewController webViewController;
  AppGet appGet = Get.find<AppGet>();
  // VideoPlayerController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.network(
  //       'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
  //   _controller.addListener(() {
  //     setState(() {});
  //   });
  //   _controller.setLooping(true);
  //   _controller.initialize().then((_) => setState(() {}));
  //   _controller.play();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  void _launchURL(String url, {bool inWebView = false}) async {
    await canLaunch(url)
        ? await launch(url, forceWebView: inWebView)
        : throw 'Could not launch $url';
  }

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

        //Server.server.getLesson(id),
        body: FutureBuilder<Lesson>(
          future: Server.server.getLesson('${widget.id}'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // List<Lessons> courses = snapshot.data.;
              //  _controller.
              appGet.setNewList(snapshot.data.listCourses);
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 200,
                          child: ViedoItem(
                            videoPlayerController: VideoPlayerController.network(
                                "${snapshot.data.course.videoLink}"
                                // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                                ),
                            looping: false,
                            autoplay: false,
                          ),
                        ),

                        // _controller.value.isInitialized
                        //     ? AspectRatio(
                        //         aspectRatio: _controller.value.aspectRatio,
                        //         child: VideoPlayer(_controller),
                        //       )
                        //     : Container(),
                        //
                        // VideosPlayer(
                        //   networkVideos: [
                        //     NetworkVideo(
                        //         id: "${snapshot.data.course.id}",
                        //         name: "Elephant Dream",
                        //         videoUrl: "${snapshot.data.course.videoLink}",
                        //         thumbnailUrl: "${snapshot.data.course.image}",
                        //         videoControl: NetworkVideoControl(
                        //           fullScreenByDefault: true,
                        //         )),
                        //   ],
                        // ),
                        // Container(
                        //   height: 250,
                        //   child: WebView(
                        //     allowsInlineMediaPlayback: true,
                        //     initialUrl: "${snapshot.data.course.videoLink}",
                        //     javascriptMode: JavascriptMode.unrestricted,
                        //     onWebViewCreated: (webViewController) {
                        //       this.webViewController = webViewController;
                        //     },
                        //     onPageStarted: (url) {
                        //       print(url);
                        //     },
                        //   ),
                        // ),

                        // GestureDetector(
                        //   onTap: () {
                        //     _launchURL(
                        //       snapshot.data.course.videoLink,
                        //       inWebView: true,
                        //     );
                        //   },
                        //   child: Container(
                        //     height: 250,
                        //     color: primeryColor,
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'وصف الدرس',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          color: Colors.white,
                          child: HtmlWidget(
                              snapshot.data.course.description.toString()),
                        ),
                        Row(
                          children: [
                            Text(
                              'مرفقات الدرس',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        snapshot.data.course.attachments.isEmpty
                            ? Text('لا توجد مرفقات')
                            : GestureDetector(
                                onTap: () {
                                  var url = snapshot
                                      .data.course.attachments.first.attachment;
                                  print(url);
                                  _launchURL(url);
                                  // snapshot
                                  //     .data.course.attachments.first.attachment == null ? print('is empty')

                                  // _launchInWebViewWithJavaScript(snapshot
                                  //     .data.course.attachments.first.attachment);
                                },
                                child: Container(
                                  width: 140,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: primeryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'تحميل المرفقات',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(Icons.download_done_outlined),
                                    ],
                                  ),
                                ),
                              ),
                        Row(
                          children: [
                            Text(
                              'التعليقات',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // comment_item
                        snapshot.data.comments.isEmpty
                            ? Text('لا توجد تعليقات')
                            : ListView.builder(
                                itemCount: snapshot.data.comments.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return commentItem(
                                      snapshot.data.comments[index]);
                                },
                              ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            //    width: 100,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: primeryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Server.server.searchCourse(
                                              _searchController.text,
                                              snapshot.data.course.id
                                                  .toString());
                                        },
                                        child: Icon(Icons.search)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        controller: _searchController,
                                        decoration: InputDecoration(
                                          hintText: 'بحث ...',
                                          hintStyle: TextStyle(fontSize: 20),
                                          //     labelStyle: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'الدروس التالية',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GetBuilder<AppGet>(
                          builder: (value) {
                            return Container(
                              height: 500,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: ListView.builder(
                                itemCount: value.listCourses.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return lessonItem(value.listCourses[index]);
                                },
                              ),
                            );
                          },
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              'اضافة تعليق',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            //    width: 100,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: primeryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Center(
                                child: TextFormField(
                                  controller: _commentController,
                                  decoration: InputDecoration(
                                    hintText: 'اكتب تعليق أو سؤال',
                                    //   hintStyle: TextStyle(fontSize: 20),
                                    //     labelStyle: TextStyle(fontSize: 20),
                                    //  icon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              color: primeryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'إرسال تعليق ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              //  return snapshot.error;
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

  Widget lessonItem(ListCourses course) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            child: Image.network(
              course.image,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                child: Text(
                  '${course.name}',
                  style: TextStyle(fontSize: 15),
                  overflow: TextOverflow.clip,
                ),
              ),
              Text(
                '${course.views}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget commentItem(Comments comment) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                      comment.userImage,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${comment.username}',
              style: TextStyle(fontSize: 15),
              overflow: TextOverflow.clip,
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 150,
          child: Text(
            '${comment.comment}',
            style: TextStyle(fontSize: 15),
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    ),
  );
}

// ListView.builder(
//                   itemCount: snapshot.data.course.id,
//                   scrollDirection: Axis.vertical,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: Container(
//                         height: 250,
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Text(
//                                     snapshot.data.course.name.toString(),
//                                   ),
//                                   Text(
//                                     snapshot.data.course.teacher.toString(),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
