import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainerBox extends StatelessWidget {
  String label;
  Function validateFun;

  Function saveFun;
  CustomContainerBox({this.label, this.saveFun, this.validateFun});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: TextFormField(
          onSaved: (newValue) {
            saveFun(newValue);
          },
          validator: (value) {
            return validateFun(value);
          },
          decoration: InputDecoration(
            hintText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
