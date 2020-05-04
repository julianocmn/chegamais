import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnAdicionar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
    child: RaisedButton(
    color: cor1,
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    onPressed: () {
      print("Botão ADICIONAR acionado!!");
    },
    child: Row(
      children: <Widget>[
        // Marca em VERDE
        Container(
          color: cor3,
          width: MediaQuery.of(context).size.width * 0.013,
          height: 65,
        ),
        // Icone
        Expanded(
          flex: 3,
          child: Container(
            child: Icon(Icons.add_circle_outline),
          ),
        ),
        // Informação 'ADICIONAR'
        Expanded(
          flex: 21,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Adicionar", style: TextStyle(fontSize: 19.0, fontFamily: 'Marvel'),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  ),
  );
}
