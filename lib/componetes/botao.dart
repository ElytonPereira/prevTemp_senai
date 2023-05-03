
import 'package:previsao_tempo/componetes/texto.dart';
import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  const Botao(
      {super.key,
      this.textoBotao,
      this.funcaoBotao,
      this.tamanhoTexto = 20,
      this.corTexto = Colors.white,
      this.corBack = Colors.black,
      this.corFront = Colors.white});

  final textoBotao;
  final funcaoBotao;
  final corTexto;
  final tamanhoTexto;
  final corBack;
  final corFront;

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: widget.corFront,
              backgroundColor: widget.corBack,
              elevation: 30,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: const Size(50, 50)),
          onPressed: widget.funcaoBotao,
          child: Texto(
              conteudo: widget.textoBotao,
              tamanho: widget.tamanhoTexto,
              cor: widget.corTexto)),
    );
  }
}
