import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:navigation_test/pages/tela_login.dart';
import 'package:navigation_test/pages/criar_conta.dart';
import 'package:navigation_test/func01/testefunc01.dart';

import 'func01/listfunc01.dart';
import 'func01/testefunc01.dart';
import 'tela_func02.dart';
import 'tela_func03.dart';
import 'tela_sec.dart';
import 'codwidgets/widget_sobre.dart';

Future<void> main() async {

  // Inicialização dos Plugins
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VemProJogo',
      
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),

      // Rotas
      initialRoute: 'T1',
      routes: {
        // Telas Criar Conta e Login
        'T0' : (context) => const TelaCriarConta(),
        'T1' : (context) => const TelaLogin(),

        // Telas Ponte
        'T2' : (context) => const TelaSecundaria(),
        'T3' : (context) => const TelaSobre(),

        // Telas Funcionalidade 01
        'T7' : (context) => const TesteFunc01(),
        'T4' : (context) => const ListFunc01(),

        // Telas Funcionalidade 02
        'T5' : (context) => const TelaFuncionalidade02(),
        // 'T8' : (context) => const ListFunc02(),

        // Telas Funcionalidade 03
        'T6' : (context) => const TelaFuncionalidade03(),
        // 'T9' : (context) => const ListFunc03(),
      },
    ),
  );
}



// AlertDialog
void alertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Cancelar Sessão?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),

        actions: <Widget>[
          TextButton(
            child: const Text("Sim"),
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, 'T3');
            },
          ),

          TextButton(
            child: const Text("Não"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

// AlertDialog 02
void alertDialog02(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Cancelar Sessão?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),

        actions: <Widget>[
          TextButton(
            child: const Text("Sim"),
            onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.popAndPushNamed(context, 'T1');
            },
          ),

          TextButton(
            child: const Text("Não"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

// Tela Sobre
class TelaSobre extends StatelessWidget {
  const TelaSobre({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Sobre'),

        leading: IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Home',
          onPressed: (){
            Navigator.popAndPushNamed(context, 'T1');
          },
        ),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,

          color: Colors.green.shade700,
          padding: const EdgeInsets.all(30.0),

          child: Column(
            children: const [
              WidgetSobre02(
                'O Tema do Aplicativo é: Futebol',
                'O Objetivo deste Aplicativo é ser um Meio Simples para Jogadores Amadores encontrarem um Local para Jogar com Facilidade.',
                'lib/imagens/foto_jogador.png',
              ),

              WidgetSobre(
                'lib/imagens/foto_dev.jpg',
                'João Pedro dos Santos Faria',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Alert Dialog Quadras
void alertDialogQuadra(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Alerta!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: const Text(
          "Confirmar Reserva?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),

        actions: <Widget>[
          TextButton(
            child: const Text("Sim"),
            onPressed: (){
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "A Quadra foi Reservada com Sucesso!",
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),

          TextButton(
            child: const Text("Não"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}