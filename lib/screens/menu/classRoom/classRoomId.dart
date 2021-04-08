// import 'package:digital_academy/backend/server.dart';
// import 'package:digital_academy/model/classesOnlineId.dart';
// import 'package:digital_academy/screens/uitls/const.dart';
// import 'package:digital_academy/screens/menu/menu.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// // ignore: must_be_immutable
// class ClassRoomId extends StatelessWidget {
//   String id;
//   ClassRoomId(this.id);
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         drawer: Menu(),
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           iconTheme: IconThemeData(color: primeryColor),
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             'الحصص الافتراضية',
//             style: GoogleFonts.roboto(
//                 fontSize: 18, color: primeryColor, fontWeight: FontWeight.w400),
//             textAlign: TextAlign.left,
//           ),
//           actions: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Image.asset(
//                 'assets/images/logo.png',
//                 height: 70,
//                 width: 70,
//               ),
//             ),
//           ],
//         ),
//         body: FutureBuilder<ClassesOnlineId>(
//           future: Server.server.getClassOnlineId(id),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               //     List<ClassesOnlineId> data = snapshot.data.data;

//               return ListView.builder(
//                 //       itemCount: data.length,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (context, index) {
//                   String url = snapshot.data.data.joinUrl;
//                   return Container(
//                     child: Text(url),
//                   );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return snapshot.error;
//             }
//             return new Center(
//               child: new Column(
//                 children: <Widget>[
//                   new Padding(padding: new EdgeInsets.only(right: 20, top: 30)),
//                   new CircularProgressIndicator(),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
