
import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnConfirmar(Function funcao) {
  return Container(
    height: 55.0,
    child: FlatButton(
        splashColor: Colors.lightBlueAccent,
        onPressed: () {
          funcao();
        },
        color: cor2,
        child: Align(
          alignment: Alignment.center,
          child: Text("Confirmar",
              style:
                  TextStyle(fontSize: 23.0, color: cor1, fontFamily: 'Marvel')),
        )),
  );
}
