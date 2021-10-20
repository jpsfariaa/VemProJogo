import 'package:flutter/material.dart';

// Show Funcionalidade 01
class WidgetShowFunc extends StatelessWidget {
  
  // Variáveis
  final String nomefunc;
  final String descricao;
  final String fotofunc;

  // Construtor
  const WidgetShowFunc(this.nomefunc, this.descricao, this.fotofunc, {Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      padding: const EdgeInsets.all(30),

      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),

        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),

        color: Colors.white54,
      ),

      width: MediaQuery.of(context).size.width * 0.80,

      child: Column(
        children: [
          Text(
            nomefunc,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(
            height: 5.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                descricao,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 5.0,
          ),

          // Incluir a Foto do Carro
          Image.asset(
            fotofunc,
            width: 175.0,
            height: 175.0,
            color: Colors.black,
            fit: BoxFit.contain,
          ),

          const SizedBox(
            height: 10.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                child: const Text('Criar'),
                onPressed: (){
                  Navigator.pushNamed(context, 'T4');
                },
                style: OutlinedButton.styleFrom(
                  primary: Colors.white70,
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ], // Children
      ),
    );
  }
}

// Show Funcionalidade 02
class WidgetShowFunc02 extends StatelessWidget {

  // Variáveis
  final String nomefunc02;
  final String descfunc02;
  final String fotofunc02;

  const WidgetShowFunc02(this.nomefunc02, this.descfunc02, this.fotofunc02, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      padding: const EdgeInsets.all(30),

      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),

        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),

        color: Colors.white54,
      ),

      width: MediaQuery.of(context).size.width * 0.80,

      child: Column(
        children: [
          Text(
            nomefunc02,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(
            height: 5.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                descfunc02,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 5.0,
          ),

          // Incluir a Foto
          Image.asset(
            fotofunc02,
            width: 175.0,
            height: 175.0,
            color: Colors.black,
            fit: BoxFit.contain,
          ),

          const SizedBox(
            height: 10.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                child: const Text('Consultar'),
                onPressed: (){
                  Navigator.pushNamed(context, 'T5');
                },
                style: OutlinedButton.styleFrom(
                  primary: Colors.white70,
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ], // Children
      ),
    );
  }
}

// Show Funcionalidade 03
class WidgetShowFunc03 extends StatelessWidget {

  // Componentes Funcionalidade 03
  final String nomefunc03;
  final String descfunc03;
  final String fotofunc03;

  const WidgetShowFunc03(this.nomefunc03, this.descfunc03, this.fotofunc03, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      padding: const EdgeInsets.all(30),

      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),

        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),

        color: Colors.white54,
      ),

      width: MediaQuery.of(context).size.width * 0.80,

      child: Column(
        children: [
          Text(
            nomefunc03,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(
            height: 5.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                descfunc03,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 5.0,
          ),

          // Incluir a Foto
          Image.asset(
            fotofunc03,
            width: 175.0,
            height: 175.0,
            color: Colors.black,
            fit: BoxFit.contain,
          ),

          const SizedBox(
            height: 10.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                child: const Text('Alugar'),
                onPressed: (){
                  Navigator.pushNamed(context, 'T6');
                },
                style: OutlinedButton.styleFrom(
                  primary: Colors.white70,
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ], // Children
      ),
    );
  }
}