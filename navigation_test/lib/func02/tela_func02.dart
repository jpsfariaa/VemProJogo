import 'package:flutter/material.dart';
import '../widgetquadras.dart';

// Tela Funcionalidade 02
class TelaFuncionalidade02 extends StatefulWidget {

  const TelaFuncionalidade02({ Key? key }) : super(key: key);

  @override
  _TelaFuncionalidade02State createState() => _TelaFuncionalidade02State();
}

class _TelaFuncionalidade02State extends State<TelaFuncionalidade02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reserva de Quadras"),
        backgroundColor: Theme.of(context).primaryColor,

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.popAndPushNamed(context, 'T2');
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 1950,

          color: Colors.green.shade700,
          padding: const EdgeInsets.all(30.0),

          child: Column(
            children: const [
              WidgetQuadras(
                'Quadra A', 
                'Rua A, 120',
                '175,00', 
                'Domingo, 17/10/2021 às 08:45', 
                '(00) 0000-0000', 
                'www.quadra.com.br',
              ),

              SizedBox(
                height: 20.0,
              ),

              WidgetQuadras(
                'Quadra B', 
                'Rua B, 720', 
                '180,00', 
                'Sábado, 16/10/2021 às 09:30', 
                '(00) 0000-0000', 
                'www.quadrab.com.br',
              ),

              SizedBox(
                height: 20.0,
              ),

              WidgetQuadras(
                'Quadra C', 
                'Rua C, 450', 
                '210,00', 
                'Sexta, 15/10/2021 às 19:00', 
                '(00) 0000-0000', 
                'www.quadrac.com.br',
              ),
            ],
          ),
        ),
      ),
    );
  }
}