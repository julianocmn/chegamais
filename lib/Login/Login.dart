import 'package:chega_mais/FinalizarCadastro/FinalizaCadastro.dart';
import 'package:chega_mais/Login/Widgets/Botoes/btnSemIcon.dart';
import 'package:chega_mais/Login/Widgets/Botoes/btnVoltar.dart';
import 'package:chega_mais/Login/Widgets/Icons/Packing.dart';
import 'package:chega_mais/Login/Widgets/Icons/icons.dart';
import 'package:flutter/material.dart';
import 'package:chega_mais/Login/Widgets/Botoes/btnIconRedondo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controles para exibição de campos
  bool _isAtivoInscrever;
  bool _isAtivoEntrarEmail;
  bool _isAtivoBotoes;

  // Exibir a senha (icon de olho)
  bool _exibirSenha = true;

  //Texts controllers
  final txtEntrarEmail = TextEditingController();
  final txtEntrarSenha = TextEditingController();

  final _txtCadastrarEmail = TextEditingController();
  final _txtCadastrarSenha = TextEditingController();
  final _txtCadastrarConfirmarSenha = TextEditingController();

  // Iniciando os campos
  @override
  void initState() {
    super.initState();

    this._isAtivoBotoes = true;
    this._isAtivoEntrarEmail = false;
    this._isAtivoInscrever = false;
  }

  // Metodo que exibe os campos para se inscrever
  void _inscrever() {
    setState(() {
      this._isAtivoInscrever = true;
      this._isAtivoBotoes = false;
      this._isAtivoEntrarEmail = false;
    });
  }

  // Metodo que volta para a tela inicial
  void _voltar() {
    setState(() {
      this._isAtivoBotoes = true;
      this._isAtivoInscrever = false;
      this._isAtivoEntrarEmail = false;
    });
  }

  // Metodo exibe campos para entrar com email
  void _entrarComEmail() {
    setState(() {
      this._isAtivoEntrarEmail = true;
      this._isAtivoBotoes = false;
      this._isAtivoInscrever = false;
    });
  }

  Future<Map> _realizarCadastro() async {
    //Fazer a verificação de senha
    if (verifEmail()) {
      if (_txtCadastrarSenha.text == _txtCadastrarConfirmarSenha.text) {
        const uri = 'http://172.20.10.4:3000/InserirEmail';

        var map = Map<String, dynamic>();

        map['UsuarioEmail'] = _txtCadastrarEmail.text;
        map['UsuarioSenha'] = _txtCadastrarConfirmarSenha.text;

        final response = await http.post(uri, body: map);
        print(json.decode(response.body));

        Navigator.pushNamed(context, '/finalizarCadastro',
            arguments: FinalizaCadastro(email: _txtCadastrarEmail.text));
      }
    }

    //return json.decode(response.body);
    return null;
  }

// Verifica o email
  bool verifEmail() {
    // Alterar Regex
    RegExp exp = new RegExp(
        r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$');

    if (exp.hasMatch(_txtCadastrarEmail.text)) {
      return true;
    } else {
      return false;
    }
  }

  // Metodo ainda não faz nada
  void _entrarComFacebook() {
    print('Facebook');
  }

  // Metodo ainda não faz nada
  void _entrarComGogle() {
    print('Google');
  }

  // Metodo para fazer o login
  void _entrar() async {
    const uri = 'http://localhost:3000/login';

    var map = Map<String, dynamic>();

    map['UsuarioEmail'] = txtEntrarEmail.text;
    map['UsuarioSenha'] = txtEntrarSenha.text;

    final response = await http.post(uri, body: map);
    var resp = json.decode(response.body);

    if(resp['status']){
      Navigator.pushNamed(context, '/home');
    }

    //Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              minHeight: MediaQuery.of(context).size.height),
          child: IntrinsicHeight(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.9],
                        colors: [Color(0xFF358CCC), Colors.black])),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 0, 25, 0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        packing(iconBox()),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Visibility(
                                  visible: this._isAtivoBotoes,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        // Inscrever
                                        btnSemIcon('Inscrever-se', _inscrever,
                                            Colors.transparent, Colors.white),
                                        Divider(),
                                        // facebook
                                        // btnIconRedondo(
                                        //     _entrarComFacebook,
                                        //     containerRedondo,
                                        //     iconFacebook(),
                                        //     'Facebook',
                                        //     false,
                                        //     0.5),
                                        // Divider(),
                                        // // google
                                        // btnIconRedondo(
                                        //     _entrarComGogle,
                                        //     containerRedondo,
                                        //     iconGoogle(),
                                        //     'Google',
                                        //     true,
                                        //     0.25),
                                        //Divider(),
                                        // Entrar com email
                                        btnSemIcon(
                                            'Entrar com e-mail',
                                            _entrarComEmail,
                                            Colors.white,
                                            Colors.black)
                                      ],
                                    ),
                                  ),
                                  replacement: Visibility(
                                    visible: this._isAtivoEntrarEmail,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          btnVoltar(iconPrevious(), _voltar),
                                          Divider(),
                                          txtCaixaGenerico(
                                              'e-mail',
                                              txtEntrarEmail,
                                              iconUser(),
                                              false,
                                              false),
                                          Divider(),
                                          txtCaixaGenerico(
                                              'senha',
                                              txtEntrarSenha,
                                              iconLocked(),
                                              true,
                                              true),
                                          Divider(),
                                          btnSemIcon('Entrar', _entrar,
                                              Colors.white, Colors.black),
                                        ],
                                      ),
                                    ),
                                    replacement: Visibility(
                                        visible: this._isAtivoInscrever,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 0, 30),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              btnVoltar(
                                                  iconPrevious(), _voltar),
                                              Divider(),
                                              Divider(),
                                              txtCaixaGenerico(
                                                'informe seu e-mail',
                                                _txtCadastrarEmail,
                                                iconUser(),
                                                false,
                                                false,
                                              ),
                                              Divider(),
                                              txtCaixaGenerico(
                                                'informe sua senha',
                                                _txtCadastrarSenha,
                                                iconLocked(),
                                                false,
                                                true,
                                              ),
                                              Divider(),
                                              txtCaixaGenerico(
                                                'repita sua senha',
                                                _txtCadastrarConfirmarSenha,
                                                iconLocked(),
                                                true,
                                                true,
                                              ),
                                              Divider(),
                                              btnSemIcon(
                                                  'Cadastrar-se',
                                                  _realizarCadastro,
                                                  Colors.white,
                                                  Colors.black),
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget containerRedondo(Widget icon, bool hasPadding, double sombra) {
    return Container(
      width: 55,
      height: 55,
      child: hasPadding
          ? Padding(
              padding: EdgeInsets.all(10),
              child: icon,
            )
          : icon,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, sombra),
                blurRadius: 10,
                offset: Offset(2, 0))
          ]),
    );
  }

  /// Metodo para exibir campos de texto senha e email.
  /// Para adicionar um icone de sufixo, só adicionar
  /// "true" no campo
  Widget txtCaixaGenerico(String hintText, TextEditingController controller,
      Widget prefixIcon, bool hasSulfix, bool isSenha) {
    return TextField(
      obscureText: isSenha ? _exibirSenha : false,
      textAlign: TextAlign.center,
      controller: controller,
      style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Marvel'),
      decoration: InputDecoration(
        contentPadding: hasSulfix
            ? EdgeInsets.fromLTRB(0.0, 15.0, -40, 15.0)
            : EdgeInsets.fromLTRB(
                20.0,
                15.0,
                20.0,
                15.0,
              ),
        prefixIcon: prefixIcon,
        suffixIcon: hasSulfix
            ? Container(
                child: FlatButton(
                  onPressed: () {
                    if (_exibirSenha) {
                      setState(() {
                        _exibirSenha = false;
                      });
                    } else {
                      setState(() {
                        _exibirSenha = true;
                      });
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 7, 0, 7),
                    child: Icon(
                        _exibirSenha ? Icons.visibility : Icons.visibility_off,
                        size: 30,
                        color: Colors.white),
                  ),
                ),
              )
            : null,
        hintText: hintText,
        hintStyle:
            TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Marvel'),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }
}
