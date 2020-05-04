import 'package:flutter/material.dart';

class BtnPadrao extends StatelessWidget {

  final Function funcao;
  final String text;

  BtnPadrao({this.text, this.funcao});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Text(text, style: TextStyle(fontFamily: 'Marvel', fontSize: 30, color: Colors.white),),

      ),
      
      onPressed: () => this.funcao(),
      color: Color(0XFF3198E4),
      
    );
  }
}