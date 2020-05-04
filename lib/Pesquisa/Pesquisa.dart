import 'package:chega_mais/Mapa/Mapa.dart';
import 'package:chega_mais/Pesquisa/Credential.dart';
import 'package:chega_mais/Pesquisa/Models/Lugares.dart';
import 'package:chega_mais/Pesquisa/Widgets/AppBarPesquisa.dart';
import 'package:chega_mais/Pesquisa/Widgets/btnEnderecoPesquisa.dart';
import 'package:chega_mais/Pesquisa/Widgets/btnEnderecoSalvo.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class Pesquisa extends StatefulWidget {
  @override
  _PesquisaState createState() => _PesquisaState();

  final lat, long;

  Pesquisa({this.lat, this.long});
}

class _PesquisaState extends State<Pesquisa> {
  List<Lugares> listLugares = [];

  void getLocationResults(String input) async {
    final Pesquisa args = ModalRoute.of(context).settings.arguments;

    print(args.lat);
    print(args.long);
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    //String type = 'geocode';
    String type = 'address';
    double lat, long;

    String request =
        '$baseURL?input=$input&key=$GOOGLE_API_KEY&type=$type&origin=${args.lat},${args.long}';

   

    Response response = await Dio().get(request);

    final predictions = response.data['predictions'];

    List<Lugares> lugares = [];
    var latitude, longitude;

    for (int i = 0; i < predictions.length; i++) {
      String name1 = predictions[i]['structured_formatting']['main_text'];
      String name = predictions[i]['structured_formatting']['secondary_text'];


      if (i == 0) lugares.add(Lugares('morra', 'Morra', '20'));
      lugares.add(Lugares(
          name1, name, '20'));

      // for (int j = 0; j < predictions[i]['terms'].length; j++) {
      //   print('${predictions[i]['terms'][j]['value']}');

      // }

      //print('${predictions[i]['structured_formatting']['main_text']}, -- ${predictions[0]['structured_formatting']['secondary_text']}');
    }

    setState(() {
      //  Lugares a = new Lugares('enderecoPart1', 'enderecoPart2');
      latitude = args.lat;
      longitude = args.long;
      listLugares = lugares;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBarPesquisa(getLocationResults),
        body: Stack(
          children: <Widget>[
            Mapa(),
            Container(
              color: Color.fromRGBO(53, 140, 204, 0.25),
              child: ListView.separated(
                itemCount: listLugares.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                      // Colocar Card do Juliano aqui
                      Padding(
                          padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: index == 0
                              ? btnEnderecoSalvo(context)
                              : btnEnderecoPesquisa(
                                      listLugares[index].enderecoPart1,
                                      listLugares[index].enderecoPart2,
                                      20, context));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                  padding: EdgeInsets.all(2),
                ),
              ),
            ),
          ],
        ));
  }
}
