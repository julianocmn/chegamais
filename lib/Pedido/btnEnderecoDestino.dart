import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnEnderecoDestino(enderecoPart1, enderecoPart2, BuildContext context,
    {nomeDestinatario}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 2, 0, 1),
    child: Container(
      width: double.infinity,
      color: cor1,
      child: Row(
        children: <Widget>[
// Marca em AZUL
          Container(
            color: cor2,
            width: MediaQuery.of(context).size.width * 0.013,
            // TAMANHO HEIGHT
            // nomeDestinatario == null ? 'height: 65,' : 'height: 80,',
            height: 65, // MENOR
            // height: 80, // MAIOR
            child: Column(
              children: <Widget>[
                Container(
                  color: cor2,
                )
              ],
            ),
          ),
// Icone
          Expanded(
            flex: 3,
            child: Container(
                // height: MediaQuery.of(context).size.height * 0.11,
                child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Icon(Icons.star),
              onPressed: () {
                print("Botão SALVAR DESTINATARIO!!");
              },
            )),
          ),

// Informação 'ENDEREÇO DESTINO'
          Expanded(
            flex: 16,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  nomeDestinatario == null
                      ? Container()
                      : Row(children: <Widget>[
                          Text(
                            nomeDestinatario,
                            style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: 'Marvel',
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  Row(children: <Widget>[
                    Flexible(
                      child: Text(
                        enderecoPart1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(fontSize: 18.0, fontFamily: 'Marvel'),
                      ),
                    )
                  ]),
                  Row(children: <Widget>[
                    Flexible(
                      child: Text(enderecoPart2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Marvel',
                            color: cor5,
                          )),
                    )
                  ]),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Text("R\$ 12,70",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Marvel',
                          color: cor3,
                        )),
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
