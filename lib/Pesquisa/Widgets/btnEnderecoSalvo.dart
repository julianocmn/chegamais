import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnEnderecoSalvo (BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
    child: RaisedButton(
    color: cor1,
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    onPressed: () {
      print("Botão ENDERECOS SALVOS acionado!!");
    },
    child: Row(
      children: <Widget>[
// Marca em VERDE
        Container(
          color: cor7,
          width: MediaQuery.of(context).size.width * 0.013,
          height: 65,
        ),
// Icone
        Expanded(
          flex: 3,
          child: Container(
            child: Icon(Icons.stars),
          ),
        ),
// Informação 'ADICIONAR'
        Expanded(
          flex: 19,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            // height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Endereços Salvos", style: TextStyle(fontSize: 19.0, fontFamily: 'Marvel'),
                )
              ],
            ),
          ),
        ),
// Botão Esquerdo
        Expanded(
          flex: 2,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Icon(Icons.chevron_right),
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