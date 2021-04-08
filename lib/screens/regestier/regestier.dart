import 'package:digital_academy/backend/server.dart';
import 'package:digital_academy/backend/appGet.dart';
import 'package:digital_academy/model/educationDivison.dart';
import 'package:digital_academy/model/educationGarde.dart';
import 'package:digital_academy/model/educationLevel.dart';
import 'package:digital_academy/screens/login/login.dart';
import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Regesiter extends StatefulWidget {
  @override
  _RegesiterState createState() => _RegesiterState();
}

class _RegesiterState extends State<Regesiter> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phonnController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController _password_confirmationController =
      TextEditingController();

  var _forkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _password_confirmationController.dispose();
    super.dispose();
  }

  String val;
  String val2;
  String val3;

  String idSelect1;
  String idSelect2;
  String idSelect3;
  AppGet appGet = Get.find();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //   backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Text(
                    'تسجيل حساب جديد',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _regesiterFor(context),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (_forkey.currentState.validate()) {
                        _forkey.currentState.save();

                        await Server.server.register(
                            _emailController.text,
                            _passwordController.text,
                            _password_confirmationController.text,
                            _nameController.text,
                            _addressController.text,
                            idSelect1,
                            idSelect2,
                            idSelect3,
                            _phonnController.text,
                            appGet.file);
                      } else {}
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        color: primeryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          'تسجيل حساب جديد',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('هل لديك حساب بالفعل ?'),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          'سجل دخول',
                          style: TextStyle(
                              color: primeryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _regesiterFor(BuildContext context) {
    return Form(
      key: _forkey,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'الاسم كاملا',
                hintStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'الاسم فارغ';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'الايميل',
                hintStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'الايميل فارغ';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phonnController,
              decoration: InputDecoration(
                hintText: 'الهاتف',
                hintStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'الهاتف فارغ';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'العنوان كاملا',
                hintStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'العنوان فارغ';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'الباسورد',
                hintStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'الباسورد فارغ';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _password_confirmationController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'تأكيد الباسورد',
                hintStyle: TextStyle(fontSize: 20),
                labelStyle: TextStyle(fontSize: 20),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'الباسورد فارغ';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // width: 300,
              height: 70,
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: FutureBuilder<LevelEducation>(
                      future: Server.server.getLevel(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<DataLevel> level = snapshot.data.data;
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value: val,
                                  iconSize: 30,
                                  //   icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  onTap: () {},
                                  hint: Text(
                                    'اختر المرحلة التعليمية *',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      val = value;
                                      val2 = null;
                                      val3 = null;
                                    });
                                  },
                                  items: level
                                      .map((e) => DropdownMenuItem(
                                            child: Text(e.name),
                                            value: e.name,
                                            onTap: () {
                                              idSelect1 = e.id.toString();
                                            },
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return snapshot.error;
                        }
                        return new Center(
                          child: new Column(
                            children: <Widget>[
                              new CircularProgressIndicator(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              //   width: 400,
              height: 70,
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: FutureBuilder<EducationGrade>(
                      future:
                          Server.server.getEducationGrade(idSelect1.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<DataGrade> garde = snapshot.data.data;
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                  value: val2,
                                  iconSize: 30,
                                  //   icon: (null),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                  hint: Text(
                                    'اختر الصف التعليمي *',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      val2 = value;
                                      print(val2);
                                    });
                                  },
                                  items: garde
                                      .map((e) => DropdownMenuItem(
                                            child: Text(e.name),
                                            value: e.name,
                                            onTap: () {
                                              idSelect2 = e.id.toString();
                                              setState(() {});
                                              print("idddd $idSelect2");
                                            },
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return snapshot.error;
                        }
                        return new Center(
                          child: new Column(
                            children: <Widget>[
                              new CircularProgressIndicator(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            idSelect2 == '11' || idSelect2 == '12'
                ? Container(
                    //    width: 300,
                    height: 70,
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: FutureBuilder<EducationDivison>(
                            future:
                                Server.server.geteducationDivison(idSelect2),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<DataDivison> divison = snapshot.data.data;
                                return Container(
                                  padding: EdgeInsets.all(8),
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        value: val3,
                                        iconSize: 30,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                        ),
                                        hint: Text(
                                          'اختر الفرع',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            val3 = value;
                                          });
                                        },
                                        items: divison
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(e.name),
                                                  value: e.name,
                                                  onTap: () {
                                                    idSelect3 = e.id.toString();
                                                  },
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return snapshot.error;
                              }
                              return new Center(
                                child: new Column(
                                  children: <Widget>[
                                    new CircularProgressIndicator(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Text(
                  'اختيار الصورة الشخصية',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                GetBuilder<AppGet>(
                  init: AppGet(),
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        controller.pickImage();
                      },
                      child: Container(
                        height: 70,
                        width: 100,
                        child: controller.file != null
                            ? Image.file(
                                controller.file,
                                fit: BoxFit.cover,
                              )
                            : Icon(Icons.add),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
