//Tirar O "Juliano" do caminho
import 'package:chega_mais/Mapa/Mapa.dart';
import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';
import 'package:chega_mais/Pedido/btnOrigem.dart';
import 'package:chega_mais/Pedido/btnDestino.dart';
import 'package:chega_mais/Pedido/btnAdicionar.dart';
import 'package:chega_mais/Pedido/btnCartaoTotal.dart';
import 'package:chega_mais/Pedido/btnConfirmar.dart';

class Confirmacao extends StatefulWidget {
  //Confirmacao({Key key, this.title}) : super(key: key);
    final enderecoParte1, enderecoParte2;

  Confirmacao({this.enderecoParte1, this.enderecoParte2});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Confirmacao> {
  
  @override
  Widget build(BuildContext context) {
    final Confirmacao args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios, color: cor4,),
        title: Text("Confirmação", style: TextStyle(fontSize: 20.0, color: cor4, fontFamily: 'Marvel')),
        centerTitle: true,
        backgroundColor: cor1,
        actions: <Widget>[],
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Stack(
          children: <Widget>[

            Mapa(),

            Container(
              color: Color.fromRGBO(53, 140, 204, 0.25),  
            ),

            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Container(
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
// Botão ORIGEM
                        btnOrigem(
                            Icon(Icons.home),
                            'Avenida Engenheiro Tasso Pinheiro, 700',
                            'Jundiaí, Jundiaí - State od São Paulo, Brazil',
                            context),
// Lista de DESTINO
                        btnDestino(
                            'Juliano César Munhoz Neves',
                            args.enderecoParte1,
                            args.enderecoParte2,
                            context),
// Botão ADICIONAR
                        btnAdicionar(context),
                        Divider(color: Colors.transparent),
                      ]),
                ),
              ),
            ),
// Botão CONFIRMAR
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 111.0,
                color: cor1,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      btnCartaoTotal(Icon(Icons.credit_card), '4000', '12,70'),
                      btnConfirmar((){}),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
// Cor de fundo da tela
      backgroundColor: cor6,
    );
  }
}