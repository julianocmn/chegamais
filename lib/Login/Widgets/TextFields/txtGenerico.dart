import 'package:flutter/material.dart';

class TxtGenerico extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget prefixIcon;
  final bool hasSulfix;
  final bool isSenha;
  final bool teste;

  TxtGenerico(
      {Key key,
      this.hintText,
      this.controller,
      this.prefixIcon,
      this.hasSulfix,
      this.isSenha,
      this.teste})
      : super(key: key);

  @override
  _TxtGenericoState createState() => _TxtGenericoState();
}

class _TxtGenericoState extends State<TxtGenerico> {
  bool _exibirSenha = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isSenha ? _exibirSenha : false,
      textAlign: TextAlign.center,
      controller: widget.controller,
      style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Marvel'),
      decoration: InputDecoration(
        contentPadding: widget.hasSulfix
            ? EdgeInsets.fromLTRB(0.0, 15.0, -40, 15.0)
            : EdgeInsets.fromLTRB(
                20.0,
                15.0,
                20.0,
                15.0,
              ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.hasSulfix
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
                  child: Icon(
                      _exibirSenha ? Icons.visibility : Icons.visibility_off,
                      size: 30,
                      color: Colors.white),
                ),
              )
            : null,
        hintText: widget.hintText,
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
