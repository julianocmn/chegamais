import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnCartaoTotal(Widget icon, String finalCartao, valorTotal) {
  return FlatButton(
    padding: EdgeInsets.all(0),
    onPressed: () {
      print('Botão CARTÃO acionado!');
    },
    child: Container(
      height: 50.0,
      child: Row(children: <Widget>[
// Dados Cartão
        Expanded(
          flex: 1,
          child: Row(
            children: <Widget>[
              icon,
              Icon(Icons.more_horiz, size: 15,),
              Text(finalCartao),
              Icon(Icons.expand_less),
            ],
          ),
        ),
// Valor TOTAL
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("Total: ", style: TextStyle(fontSize: 20.0, fontFamily: 'Marvel', color: cor4,)),
              Text("R\$ $valorTotal", style: TextStyle(fontSize: 20.0, fontFamily: 'Marvel', color: cor3,)),
            ],
          ),
        ),
// ----------------------------------------------------------------------------------
      ]),
    ),
  );
}
