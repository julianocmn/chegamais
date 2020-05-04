  import 'package:flutter/material.dart';


Widget btnSemIcon(String text, Function entrar, Color corFundo, Color corFonte) {
    return RaisedButton(
      child: Text(
        text,
        style:
            TextStyle(color: corFonte, fontSize: 25, fontFamily: 'Marvel'),
      ),
      onPressed: () {
        entrar();
      },
      color: corFundo,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Colors.white)
      ),
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
    );
  }
