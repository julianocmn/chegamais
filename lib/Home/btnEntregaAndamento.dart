import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnEntregaAndamento(BuildContext context) {
  return RaisedButton(
      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
      onPressed: () {
        print('Botão ENTREGA EM ANDAMENTO acionado!!');
      },
      color: cor1,
      child: Row(
        children: <Widget>[
          // Marca em VERDE
          Container(
            color: cor2,
            width: MediaQuery.of(context).size.width * 0.013,
            height: 60,
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                // Texto 'Entrega em andamento'
                Align(
                  alignment: Alignment.center,
                  child: Text('Entregas em andamento', style: TextStyle(fontSize: 20.0, fontFamily: 'Marvel')),
                ),
                // Quantidade (bolinha verde)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(color: cor3, shape: BoxShape.circle),
                    child: Text('15', textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, fontFamily: 'Marvel', color: cor1)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
