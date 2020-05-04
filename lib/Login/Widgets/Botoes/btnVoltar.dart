import 'package:flutter/material.dart';

Widget btnVoltar(Widget icon, Function voltar) {
  return FlatButton(
    child: Row(
      children: <Widget>[
        icon,
        Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              'Voltar',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Marvel', fontSize: 20),
            ))
      ],
    ),
    onPressed: () {
      voltar();
    },
  );
}
