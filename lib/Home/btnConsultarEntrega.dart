import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnConsultarEntrega(BuildContext context) {
  return RaisedButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        print('Botão CONSULTA ENTREGA acionado!!');
      },
      color: cor1,
      child: Row(
        children: <Widget>[
          Container(
            color: cor2,
            width: MediaQuery.of(context).size.width * 0.013,
            height: 60,
          ),
          Expanded(
              flex: 1,
              child: Text("Consultar Entrega", textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, fontFamily: 'Marvel'))),
        ],
      ),
    );
}
