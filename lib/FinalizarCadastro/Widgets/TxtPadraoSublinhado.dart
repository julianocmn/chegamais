import 'package:flutter/material.dart';

class TxtPadraoSublinhado extends StatelessWidget {
  final label;
  final controller;
  final isEnabled;
  final type;

  TxtPadraoSublinhado({this.label, this.controller, this.isEnabled, this.type});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          //suffixIcon: Text("Morra"),
          labelText: this.label,
          labelStyle: TextStyle(
              fontFamily: 'Imprima', color: Color(0XFF888888), fontSize: 10),
          //contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0XFFE9E9E9))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0XFFE9E9E9)))),
      style: TextStyle(fontFamily: 'Imprima', fontSize: 20),
      controller: this.controller,
      enabled: isEnabled,
      keyboardType: type,
    );
  }
}
