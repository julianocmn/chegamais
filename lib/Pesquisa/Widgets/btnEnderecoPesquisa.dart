import 'package:chega_mais/Pedido/OqueSeraEntregue.dart';
import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnEnderecoPesquisa(String enderecoPart1, enderecoPart2,
    double distancia, BuildContext context) {
  return RaisedButton(
    color: cor1,
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    onPressed: () {
      Navigator.pushNamed(context, '/oqueseraentregue', arguments: OqueSeraEntregue(enderecoParte1: enderecoPart1, enderecoParte2: enderecoPart2));
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
          child: Container(
            child: Icon(Icons.room),
          ),
        ),

// Informação 'ENDEREÇO'
        Expanded(
          flex: 16,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Row(children: <Widget>[Text(enderecoPart1,style: TextStyle(fontSize: 18.0, fontFamily: 'Marvel'))]),
                Row(children: <Widget>[
                  Flexible(
                      child: Text(enderecoPart1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: 'Marvel')))
                ]),
                Row(children: <Widget>[
                  Flexible(
                      child: Text(enderecoPart2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Marvel',
                              color: cor5)))
                ]),
              ],
            ),
          ),
        ),
// Distancia em KM
        Expanded(
          flex: 5,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text("$distancia km",
                      style: TextStyle(
                          fontSize: 20.0, fontFamily: 'Marvel', color: cor3)),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
