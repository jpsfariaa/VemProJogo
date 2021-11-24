import 'package:flutter/material.dart';

// Widget1 Sobre
class WidgetSobre extends StatelessWidget {
  
  // Coleta de Informações
  final String foto;
  final String dev;
  
  // Construtor
  const WidgetSobre(this.foto, this.dev, { Key? key }) : super(key: key);

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

      width: MediaQuery.of(context).size.width * 0.50,

      child: Column(
        children: [
          Text(
            "Desenvolvedor: " + dev,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          // Incluir a Foto do Dev
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
            ),
            child: Image.asset(
              foto,
              width: 275.0,
              height: 275.0,
              fit: BoxFit.contain,
            ),
          ),

        ], // Children
      ),
    );
  }
}

// Widget2 Sobre
class WidgetSobre02 extends StatelessWidget {

  // Coleta de Informações
  final String tema;
  final String objetivo;
  final String fotosobre;

  const WidgetSobre02(this.tema, this.objetivo, this.fotosobre, { Key? key }) : super(key: key);

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

      width: MediaQuery.of(context).size.width * 0.50,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tema,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          
          const SizedBox(
            height: 2.0,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                objetivo,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ],
          ),


          Image.asset(
            fotosobre,
            width: 175.0,
            height: 175.0,
            color: Colors.white,
            fit: BoxFit.contain,
          ),
        ], // Children
      ),
    );
  }
}