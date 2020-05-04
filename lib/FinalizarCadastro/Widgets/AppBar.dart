import 'package:flutter/material.dart';

Widget barra(String text) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: AppBar(
      title: Text(
        text,
        textAlign: TextAlign.center,
        style:
            TextStyle(fontFamily: 'Marvel', color: Colors.black, fontSize: 25),
      ),
      leading: Container(),
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
  );
}
