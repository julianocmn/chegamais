import 'package:chega_mais/FinalizarCadastro/Widgets/AppBar.dart';
import 'package:chega_mais/FinalizarCadastro/Widgets/TxtPadraoSublinhado.dart';
import 'package:chega_mais/FinalizarCadastro/Widgets/btnPadrao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FinalizaCadastro extends StatefulWidget {
  @override
  _FinalizaCadastroState createState() => _FinalizaCadastroState();
  final email;

  FinalizaCadastro({this.email});
}

class _FinalizaCadastroState extends State<FinalizaCadastro> {
  final txtNomeController = TextEditingController();
  final txtSobreNomeController = TextEditingController();
  final txtCelularController = TextEditingController();
  final txtControllerEmail = TextEditingController();

  void _finalizarCadastro() async {
    const uri = 'http://172.20.10.4:3000/InserirInformacoes';

            var map = Map<String, dynamic>();

            map['UsuarioNome'] = txtNomeController.text;
            map['UsuarioSobreNome'] = txtSobreNomeController.text;
            map['UsuarioFone'] = txtCelularController.text;
            map['UsuarioEmail'] = txtControllerEmail.text;

            final response = await http.put(uri, body: map);
            print(json.decode(response.body));

            Navigator.pushNamed(context, '/home',);

  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width
    );

    final FinalizaCadastro args = ModalRoute.of(context).settings.arguments;

    setState(() {
      txtControllerEmail.text = args.email;
    });

    return WillPopScope(
        onWillPop: () async => false,
        //child: SafeArea(
        child: Scaffold(
            appBar: barra("Perfil"),
            body: SingleChildScrollView(
                child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 100,
                  minHeight: MediaQuery.of(context).size.height - 100),
              child: IntrinsicHeight(
                  child: Container(
                color: Color(0XFFE9E9E9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisAlignment: MainAxisAlignment.,
                  children: <Widget>[
                    //3
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.person,
                                        size: 80,
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Trocar Imagem de perfil",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Roboto',
                                            )),
                                        Icon(Icons.chevron_right)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: Divider(color: Color(0XFFE9E9E9))),

                              //Divider(color: Color(0XFFE9E9E9)),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  // padding: EdgeInsets.fromLTRB(left, top, right, bottom)
                                  child: TxtPadraoSublinhado(
                                      label: 'NOME',
                                      controller: txtNomeController,
                                      isEnabled: true)),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: TxtPadraoSublinhado(
                                      label: 'SOBRENOME',
                                      controller: txtSobreNomeController,
                                      isEnabled: true)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // 2
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: <Widget>[
                              //Divider(color: Colors.black),
                              //Divider(color: Color(0XFFE9E9E9)),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: TxtPadraoSublinhado(
                                    label: 'CELULAR',
                                    controller: txtCelularController,
                                    isEnabled: true,
                                    type: TextInputType.number,
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: TxtPadraoSublinhado(
                                      label: 'E-MAIL',
                                      controller: txtControllerEmail,
                                      isEnabled: false)),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // 2
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                              BtnPadrao(
                              text: 'Finalizar Cadastro',
                              funcao: _finalizarCadastro,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              //   )
            ))));
  }
}
