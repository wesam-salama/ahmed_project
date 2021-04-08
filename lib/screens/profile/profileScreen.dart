import 'package:digital_academy/backend/appGet.dart';
import 'package:digital_academy/screens/home/homeScreen.dart';
import 'package:digital_academy/screens/profile/customProfile/tabContorl.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:digital_academy/screens/uitls/custom_dialoug.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  AppGet appget = Get.find();
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
            'الصفحة الشخصية',
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ),
          ],
        ),
        body: Container(
          child: Obx(() => appget.mapProfile.value.id == null
              ? loading()
              : ListView(children: <Widget>[
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  appget.mapProfile.value.image,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TapControl(),
              
                ])),
        ),
      ),
    );
  }
}
