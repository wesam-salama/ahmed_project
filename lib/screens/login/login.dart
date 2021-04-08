import 'package:digital_academy/backend/server.dart';

import 'package:digital_academy/screens/uitls/const.dart';
import 'package:flutter/material.dart';
import 'package:digital_academy/screens/regestier/regestier.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var _forkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'تسجيل دخول',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _logFor(context),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_forkey.currentState.validate()) {
                      _forkey.currentState.save();
                      await Server.server.login(
                          _emailController.text, _passwordController.text);
                    }
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
                        'تسجيل دخول',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('لا تمتلك حساب ؟'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Regesiter()));
                      },
                      child: Text(
                        'سجل حساب جديد',
                        style: TextStyle(
                            color: primeryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget _logFor(BuildContext context) {
    return Form(
      key: _forkey,
      child: Column(
        children: [
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
          SizedBox(
            height: 10,
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
        ],
      ),
    );
  }
}
