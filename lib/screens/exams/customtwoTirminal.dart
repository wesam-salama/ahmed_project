// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class CustonScoendTerminal extends StatelessWidget {
//   String text;
//   Function onClick;
//   CustonScoendTerminal({this.text, this.onClick});
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onClick(),
//       child: Container(
//         height: 30,
//         width: 150,
//         decoration: BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(40),
//               topLeft: Radius.circular(40),
//             ),
//             border: Border.all(color: Colors.white)),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//                 color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }
