import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:previsao_tempo/componetes/botao.dart';
import 'package:previsao_tempo/componetes/caixaTexto.dart';
import 'package:previsao_tempo/componetes/texto.dart';
import 'package:http/http.dart';

class TelPreTempo extends StatefulWidget {
  const TelPreTempo({super.key});

  @override
  State<TelPreTempo> createState() => _TelPreTempoState();
}

class _TelPreTempoState extends State<TelPreTempo> {

  final formKey = GlobalKey<FormState>();
  final txtCep = TextEditingController();
  String uf ='';
  String cidade= '';
  String data ='';
  String horario ='';
  String temperatura ='';
  String descricaoTemp = '';

  @override
  Widget build(BuildContext context) {
    
    consultaApi() async {
      final String urlViaCep = 'https://viacep.com.br/ws/${txtCep.text}/json/';
      
      Response respostaCep = await get(Uri.parse(urlViaCep));
      Map endereco = json.decode(respostaCep.body);
      print(respostaCep.body);
      cidade = '${endereco['localidade']}';
      uf = '${endereco['uf']}';

      final String urlApiTempo = 'https://api.hgbrasil.com/weather?format=json-cors&key=49fd9961&city_name=$cidade,$uf';
      print(urlApiTempo);
      Response respostaTemp = await get(Uri.parse(urlApiTempo));
      Map infoPrev = json.decode(respostaTemp.body);
      //print(respostaTemp.body);

      data ='${infoPrev['results']['date']}';
      horario ='${infoPrev['results']['time']}';
      temperatura ='${infoPrev['results']['temp']}';
      descricaoTemp = '${infoPrev['results']['description']}';

      setState(() {
        
      });
        

    }

    criaAppBar(){
      return AppBar(
        title: const Texto(
          conteudo: 'Previsão do tempo',          
        ),
        centerTitle: true,
      );
    }

    criaRowCepBotao(){
      return Row(
        children: [
          Expanded(
              child: CaixaTexto(
                controlador: txtCep,
                msgValidacao: 'Cep obrigatório',
                texto: 'Cep',
              ),
            ),
            Expanded(
              child: Botao(
                textoBotao: 'Pesquisar',              
                funcaoBotao: consultaApi,              
            
              ),
            )
        ],
      );
    }

    criaColumnContainer(){
      
    }

    criaBody(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            criaRowCepBotao(),
            Texto(
              conteudo: 'Cidade: $cidade ${uf.toUpperCase()}',
            ),
            Texto(
              conteudo: 'Data: $data',
            ),
            Texto(
              conteudo: 'Hora: $horario',
            ),
            Texto(
              conteudo: 'Temperatura: $temperatura',
            ),
            Texto(
              conteudo: 'Descrição: $descricaoTemp',
            ),
            
            
          ],
        )),
      );
    }

    return Scaffold(
      appBar: criaAppBar(),
      body: criaBody(),
    );
  }
}