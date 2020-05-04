import 'package:chega_mais/Mapa/Mapa.dart';
import 'package:chega_mais/Pedido/confirmacao.dart';
import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';
import 'package:chega_mais/Pedido/btnEnderecoDestino.dart';
import 'package:chega_mais/Pedido/btnDestinatario.dart';
import 'package:chega_mais/Pedido/btnConteudo.dart';
import 'btnConfirmar.dart';
// import 'package:chega_mais/Pedido/btnDestino.dart'; não usar pois são cards diferentes
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.red,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.green,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class OqueSeraEntregue extends StatefulWidget {
  @override
  _OqueSeraEntregueState createState() => _OqueSeraEntregueState();

  final enderecoParte1, enderecoParte2;

  OqueSeraEntregue({this.enderecoParte1, this.enderecoParte2});
}

class _OqueSeraEntregueState extends State<OqueSeraEntregue> {



  @override
  Widget build(BuildContext context) {

    final OqueSeraEntregue args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: cor4,
        ),
        title: Text('O que será entregue?',
            style:
                TextStyle(fontSize: 22.0, color: cor4, fontFamily: 'Marvel')),
        centerTitle: true,
        backgroundColor: cor1,
      ),
      body: Stack(
        children: <Widget>[
          Mapa(),
          Container(
            color: Color.fromRGBO(53, 140, 204, 0.25),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Endereço
                          btnEnderecoDestino(
                            args.enderecoParte1,
                            args.enderecoParte2,
                            context,
                          ),
                          // Destinatario
                          btnDestinatario('Juliano César Munhoz Neves',
                              '(11)98624-9481', context),
                          // Conteudo
                          btnConteudo(context),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
// Botão CONFIRMAR
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 61.0,
              color: cor1,
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    btnConfirmar(() {
                      Navigator.pushNamed(context, '/confirmacao', arguments: Confirmacao(enderecoParte1: args.enderecoParte1, enderecoParte2: args.enderecoParte2,));
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      //Fundo da Tela
      backgroundColor: cor6, // Map here
    );
  }
}
