import 'package:chega_mais/colors.dart';
import 'package:flutter/material.dart';

    Widget AppBarPesquisa(Function getLocationResults){

      return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: cor1,
      title: Container(
        height: 42,
        child: TextField(
          autofocus: true,
          onChanged: (text) {
            getLocationResults(text);
          },
          style: TextStyle(
              fontFamily: 'Marvel',
              fontSize: 22,
              foreground: Paint()..color = Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Pesquisar endereço",
              hintStyle: TextStyle(color: Colors.black, fontSize: 20),
              suffixIcon: RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.search, color: Colors.black),
              ),
              fillColor: Colors.white,
              filled: true),
        ),
      ),
    );
  }


    
    