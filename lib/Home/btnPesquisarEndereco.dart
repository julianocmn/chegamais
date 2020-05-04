import 'package:chega_mais/Pesquisa/Pesquisa.dart';
import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnPesquisarEndereco(BuildContext context, latitude, longitude) {
  return RaisedButton(
    color: cor1,
    onPressed: () {
      //print('Botão PESQUISAR ENDEREÇO acionado!!');
      print('btn $latitude, $longitude');
      Navigator.pushNamed(context, '/pesquisa',
          arguments: Pesquisa(
            lat: latitude,
            long: longitude,
          ));
    },
    child: Container(
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 21,
            child: Text(
              "Pesquisar Endereço",
              style: TextStyle(fontSize: 20.0, fontFamily: 'Marvel'),
            ),
          ),
          Expanded(flex: 3, child: Icon(Icons.search)),
        ],
      ),
    ),
  );
}
