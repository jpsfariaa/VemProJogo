// Tela Secundária
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'codwidgets/widget_showfunc.dart';

class TelaSecundaria extends StatefulWidget {
  const TelaSecundaria({ Key? key }) : super(key: key);

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  // ignore: prefer_typing_uninitialized_variables
  var nameUser;

  @override
  Widget build(BuildContext context) {

    nameUser = FirebaseAuth.instance.currentUser!.email;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Menu'),

        leading: IconButton(
          tooltip: 'Disconnect',
          icon: const Icon(Icons.close),
              
          onPressed: (){
            alertDialog02(context);
          },
        ),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              tooltip: 'About',
              icon: const Icon(Icons.info),
              
              onPressed: (){
                alertDialog(context);
              },
            ),
          ),
        ],
        
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 1350,

          color: Colors.green.shade700,
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Olá, $nameUser. Seja Bem-Vindo(a)!",
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )
                  ),

                  SizedBox(
                    height: 75.0,
                  ),
                ],
              ),
              
              Column(
                children: const [
                  Text(
                    "Funcionalidades: ",
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
      
              const SizedBox(
                height: 15.0,
              ),
      
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  WidgetShowFunc(
                    'Listagem de Metas', 
                    'Com esta Funcionalidade você poderá Criar uma Lista de Metas.',
                    'lib/imagens/foto_metas.png',
                  ),
      
                  SizedBox(
                    height: 15.0,
                  ),
      
                  WidgetShowFunc02(
                    'Consultar Quadras', 
                    'Com esta Funcionalidade você poderá Consultar Quadras Próximas e suas Disponibilidades.', 
                    'lib/imagens/foto_estadio.png',
                  ),

                  SizedBox(
                    height: 15.0,
                  ),

                  WidgetShowFunc03(
                    'Alugar Área', 
                    'Com esta Funcionlidade você poderá Alugar a Área Externa da Quadra pra fazer aquele Churrasco.',
                    'lib/imagens/foto_alugar.png',
                  ),
                ],
              ),
      
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}