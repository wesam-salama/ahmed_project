import 'package:digital_academy/backend/appGet.dart';
import 'package:digital_academy/screens/profile/customProfile/editprofile.dart';
import 'package:digital_academy/screens/profile/customProfile/myExams.dart';
import 'package:digital_academy/screens/profile/customProfile/getOrderScreen.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:digital_academy/screens/uitls/customContainerBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TapControl extends StatefulWidget {
  @override
  _TapControlState createState() => _TapControlState();
}

class _TapControlState extends State<TapControl> {
  AppGet appget = Get.find();
  String oldOassword;

  String newPassword;

  oldpassword(String value) {
    this.oldOassword = value;
  }

  newpassword(String value) {
    this.newPassword = value;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // length of tabs
      initialIndex: 0,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: TabBar(
                labelColor: primeryColor,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: 'البيانات'),
                  Tab(text: 'كلمة السر '),
                  Tab(text: 'الاشتراكات'),
                  Tab(text: 'امتحاناتي'),
                ],
              ),
            ),
            Container(
              height: 400, //height of TabBarView
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: TabBarView(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'رقم تسجيل الطالب',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Text(
                            appget.mapProfile.value.id.toString(),
                            style: TextStyle(
                              color: primeryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'الاسم',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Text(
                            appget.mapProfile.value.name,
                            style: TextStyle(
                              color: primeryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'البريد الإلكتروني',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Text(
                            appget.mapProfile.value.email,
                            style: TextStyle(
                              color: primeryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'رقم الهاتف',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Text(
                            appget.mapProfile.value.phone.toString(),
                            style: TextStyle(
                              color: primeryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'العنوان',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Text(
                            appget.mapProfile.value.address.toString(),
                            style: TextStyle(
                              color: primeryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile()));
                        },
                        child: Container(
                          height: 40,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primeryColor,
                          ),
                          child: Center(
                            child: Text(
                              'تعديل البيانات',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(child: Text('تغير كلمة السر')),
                      SizedBox(
                        height: 20,
                      ),
                      CustomContainerBox(
                        label: '  كلمة السر القديمة',
                        saveFun: oldpassword,
                        validateFun: null,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomContainerBox(
                        label: '  كلمة السر الجديدة',
                        saveFun: newpassword,
                        validateFun: null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: primeryColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Center(
                            child: Text(
                              'تسجيل دخول',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GetOrderScreen(),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: MyExam(),
                ),
              ]),
            ),
          ]),
    );
  }
}
