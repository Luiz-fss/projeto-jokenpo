import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Jogo(),
  debugShowCheckedModeBanner: false,
));

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _mensagem = "Escolha uma opção abaixo";
  var _imagemApp = AssetImage("imagens/padrao.png");

  void opcaoSelecionada(String opcSelecionada){

    var opc = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opc[numero];

    //uma forma de validar e alterar a opção escolhida pelo app
    /*
    setState(() {
      if(escolhaApp == "pedra"){
        this._imagemApp = AssetImage("imagens/pedra.png");
      }
      else if (escolhaApp =="tesoura"){
        this._imagemApp = AssetImage("imagens/tesoura.png");
      }
      else if (escolhaApp =="papel"){
       this._imagemApp = AssetImage("imagens/papel.png");
      }
    });

    */

    //segunda forma

    switch (escolhaApp ){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });

        break;

      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });

        break;

      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });

        break;
    //validação do ganhador
    //usuario ganhador
    }

    if(
    (opcSelecionada == "pedra" && escolhaApp == "tesoura")||
        (opcSelecionada == "tesoura" && escolhaApp == "papel") ||
        (opcSelecionada == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Parabéns você venceu !";
      });
    }
    //app venceu
    else if(
    (opcSelecionada == "pedra" && escolhaApp == "papel")||
        (opcSelecionada == "tesoura" && escolhaApp == "pedra") ||
        (opcSelecionada == "papel" && escolhaApp == "tesoura")
    ) {
      setState(() {
        this._mensagem = "Infelizmente você perdeu !";
      });
    }
    //empate
    else if(
    (opcSelecionada == "pedra" && escolhaApp =="pedra") ||
        (opcSelecionada == "papel" && escolhaApp =="papel") ||
        (opcSelecionada == "tesoura" && escolhaApp =="tesoura")
    ){
      setState(() {
        this._mensagem = "Empate !";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOKENPO"),
      ) ,
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(image: this._imagemApp,),


          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[

              GestureDetector(
                child: Image.asset("imagens/pedra.png", height: 95),
                onTap: (){
                  opcaoSelecionada("pedra");
                },
              ),

              GestureDetector(
                child: Image.asset("imagens/papel.png", height: 95,),
                onTap: (){
                  opcaoSelecionada("papel");
                },
              ),

              GestureDetector(
                child: Image.asset("imagens/tesoura.png", height: 95,),
                onTap: (){
                  opcaoSelecionada("tesoura");
                },
              )
              /*
              Image.asset("imagens/pedra.png", height: 95),
              Image.asset("imagens/papel.png", height: 95,),
              Image.asset("imagens/tesoura.png", height: 95,),
              */

            ],
          )

        ],
      ),
    );
  }
}
