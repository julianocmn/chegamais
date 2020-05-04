import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnDestinatario(String nomeDestinatario, celularDestinatario, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 2, 0, 1),
    child: FlatButton(
      color: cor1,
      padding: EdgeInsets.all(0),
      onPressed: (){print('Botão DESTINATARIO adcionado!! ');},
      child: Container(
      width: double.infinity,
      height: 85,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
// Marca em AZUL
          Container(
            color: cor2,
            width: MediaQuery.of(context).size.width * 0.013,
            height: 85,
            child: Column(
              children: <Widget>[
                Container(
                  color: cor2,
                )
          ],
            ),
    ),
// Coluna
Expanded(
  flex: 1,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
// Titulo Destinatario
      Expanded(
        flex: 1,
        child: Padding(
        padding: EdgeInsets.fromLTRB(3, 3, 3, 0),
          child: Container(
            child: Text('Destinatario', style: TextStyle(fontSize: 14.0, color: cor4, fontFamily: 'Imprima')),
        ),
      ),
      ),
// Detalhes do Destinatario
Expanded(
  flex: 3,
  child: Padding(
  padding: EdgeInsets.fromLTRB(3, 1, 0, 3),
  child: Container(
    child: Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
// Icone: Person
Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(color: cor5, shape: BoxShape.circle),
      child: Icon(Icons.person, color: cor1, size: 35,), 
    ),
// Destinatario: Nome/Celular
Expanded(
  flex: 1,
  child: Padding(
    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Row(children: <Widget>[Flexible(child: Text(nomeDestinatario, overflow: TextOverflow.ellipsis, softWrap: false, style: TextStyle(fontSize: 20.0, fontFamily: 'Marvel', color: cor4)))]),
      Divider(height: 3, color: Colors.transparent,),
      Row(children: <Widget>[Flexible(child: Text(celularDestinatario, overflow: TextOverflow.ellipsis, softWrap: false, style: TextStyle(fontSize: 17.0, fontFamily: 'Imprima', color: cor5)))]),
    ],
  ),
  ),
), 
  ],
),
  ),
),
),

    ],
  )
),
// Seta Direta/Chevron: > 
Container(
  alignment: Alignment.centerRight,
  child: Icon(Icons.chevron_right),
),
        ],
      ),
    ),
    ),
  );
}
