import 'package:flutter/material.dart';

class CaixaTexto extends StatefulWidget {
  const CaixaTexto(
      {super.key,
      this.controlador,
      this.msgValidacao,
      this.texto,
      this.senha = false});

  final controlador;
  final msgValidacao;
  final texto;
  final senha;

  @override
  State<CaixaTexto> createState() => _CaixaTextoState();
}

class _CaixaTextoState extends State<CaixaTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: widget.controlador,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.msgValidacao;
          }
        },
        obscureText: widget.senha,
        decoration: InputDecoration(
            labelText: widget.texto,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
