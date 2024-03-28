import 'package:flutter/material.dart';

class textformField extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
    ),
        label:Text("asd")),
    );
  }
}
