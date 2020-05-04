import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

Widget btnConteudo(BuildContext context){
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 2, 0, 1),
    child: Container(
      color: cor1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//Marca em AZUL
        Container(
          color: cor2,
          width: MediaQuery.of(context).size.width * 0.013,
          height: 155,
          // height: double.infinity,
          child: Column(
            children: <Widget>[
              Container(color: cor2,)
            ],
          ),
        ),
// Coluna
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 5, 4),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
// TITULO
              Container(child: Text('Conteúdo da Entrega', style: TextStyle(fontSize: 14.0, color: cor4, fontFamily: 'Imprima')),),
// FOTO
Row(
  children: <Widget>[
    Padding(
      padding: EdgeInsets.fromLTRB(0, 3, 3, 3),
    child: Container(
              width: 60, height: 60, // Largura / Alturua
              child: FlatButton(
                color: cor1,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(0),  side: BorderSide(color: cor5)),
                child: Container(width: 60, height: 60, child: Icon(Icons.add_a_photo, color: cor5),),
                onPressed: (){},
              ),
            ),
    ),
  ],
),
// CAIXA DE TEXTO
              Container(
                color: cor6, 
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Exemplo: Carteira de Trabalho do João', 
                    contentPadding: const EdgeInsets.all(5)
                    )
                  )
                ),
            ],
          ),
          ),
        ),
      ],
    ),
    ),
  );
}