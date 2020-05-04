import 'package:chega_mais/Mapa/Mapa.dart';
import 'package:flutter/material.dart';
import 'package:chega_mais/colors.dart';

// Tirar o Juliano do caminho
import 'package:chega_mais/Home/btnEntregaAndamento.dart';
import 'package:chega_mais/Home/btnPesquisarEndereco.dart';
import 'package:chega_mais/Home/btnConsultarEntrega.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

// TESTE long e lat
// flutter: 37.785834
// flutter: -122.406417

class Home extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<Home> {
  String error;
  var lat, long;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.menu,
              color: cor4,
            ),
            title: Text("Chega+",
                style: TextStyle(
                    fontSize: 20.0, color: cor4, fontFamily: 'Marvel')),
            centerTitle: true,
            backgroundColor: cor1,
          ),
          body: Stack(
            children: <Widget>[
              Mapa(),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
// Espaço Superior
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Botão Pesquisar Endereço
                            btnPesquisarEndereco(
                                context, 37.785834, -122.406417),
                          ],
                        ),
                      ),
// Espaço Inferior
                      Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              // Botão Consultar entrega
                              btnConsultarEntrega(context),
                              Divider(color: Colors.transparent),
                              // Botão Entregas em andamento
                              btnEntregaAndamento(context),
                            ],
                          )),
                    ],
                  ),
                ),
                // Colocar no Arquivo de cores
                color: Color.fromRGBO(53, 140, 204, 0.25),
              ),
            ],
          )),
    );
  }

  _getCurrentLocation() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    setState(() {
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          lat = position.latitude;
          long = position.longitude;
        });
        print('$lat morra');
        print(long);
      }).catchError((e) {
        print(e);
      });
    });
    
  }



}
