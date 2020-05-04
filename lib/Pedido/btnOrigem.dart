import 'package:chega_mais/colors.dart';
import 'package:flutter/material.dart';

Widget btnOrigem(
    Widget icon, enderecoPart1, String enderecoPart2, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
    child: RaisedButton(
    color: cor1,
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    onPressed: () {
      print("Botão ORIGEM acionado!!");
    },
    child: Row(
      children: <Widget>[
// Marca em AZUL
        Container(
          color: cor2,
          width: MediaQuery.of(context).size.width * 0.013,
          height: 65,
        ),
// Icone
        Expanded(
          flex: 3,
          child: Container(child: icon,),
        ),

// Informação 'ENDEREÇO ORIGEM'
        Expanded(
          flex: 21,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(children: <Widget>[
                  Text(
                    enderecoPart1,
                    style: TextStyle(fontSize: 18.0, fontFamily: 'Marvel'),
                  )
                ]),
                Row(children: <Widget>[
                  Text(enderecoPart2,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Marvel',
                        color: cor5,
                      ))
                ]),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
  );
}
