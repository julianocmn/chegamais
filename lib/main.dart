import 'package:chega_mais/FinalizarCadastro/FinalizaCadastro.dart';
import 'package:chega_mais/Login/Login.dart';
import 'package:chega_mais/Home/Home.dart';
import 'package:chega_mais/Pedido/OqueSeraEntregue.dart';
import 'package:chega_mais/Pedido/confirmacao.dart';
import 'package:chega_mais/Pesquisa/Pesquisa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Chega+',
      initialRoute: '/home',
      routes: {
        '/': (context) => Login(),
        '/finalizarCadastro': (context) => FinalizaCadastro(),
        '/home' : (context) => Home(),
        '/pesquisa' : (context) => Pesquisa(),
        '/oqueseraentregue' : (context) => OqueSeraEntregue(),
        '/confirmacao' : (context) => Confirmacao(),
        
       },
    );
  }
}
