import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/uitls/customContainerBox.dart';
import 'package:digital_academy/screens/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CallUs extends StatelessWidget {
  String userName;
  String email;
  String phone;
  String nameAdress;
  String password;
  saveEmail(String value) {
    this.email = value;
  }

  saveName(String value) {
    this.userName = value;
  }

  savephone(String value) {
    this.phone = value;
  }

  saveNameAdress(String value) {
    this.nameAdress = value;
  }

  // ignore: missing_return
  String nullValidator(String value) {
    if (value.length == 0 || value == null || value == '') {
      return 'Required Field';
    }
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
            'اتصل بنا',
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
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  //   color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.lock_clock,
                      color: primeryColor,
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'من الساعة 1 ضهرا حتى الساعة 10 مساء',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  //   color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.location_on,
                      color: primeryColor,
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'جمهورية مصر العربية',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  //   color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.call,
                      color: primeryColor,
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '01067189466 ( 2+)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '01093139057 ( 2+)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ',واتس : 01200036650 ( 2+)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'النموذح البريدي',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomContainerBox(
                      label: 'الاسم',
                      saveFun: saveName,
                      validateFun: nullValidator,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomContainerBox(
                      label: 'البريد الالكتروني',
                      saveFun: saveEmail,
                      validateFun: nullValidator,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomContainerBox(
                      label: 'رقم الهاتف',
                      saveFun: savephone,
                      validateFun: nullValidator,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomContainerBox(
                      label: 'عنوان الرسالة',
                      saveFun: saveNameAdress,
                      validateFun: nullValidator,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'الرسالة',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => () {},
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            color: primeryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'ارسال',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
