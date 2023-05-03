import 'package:flutter/material.dart';

class Texto extends StatefulWidget {
  const Texto({super.key, this.conteudo, this.cor =Colors.black, this.tamanho = 15});

  final conteudo;
  final cor;
  final tamanho;

  @override
  State<Texto> createState() => _TextoState();
}

class _TextoState extends State<Texto> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.conteudo,
      style: TextStyle(
        color: widget.cor,
        fontSize: widget.tamanho,
      ),
    );
  }
}
