import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaCriarConta extends StatefulWidget {
  const TelaCriarConta({ Key? key }) : super(key: key);

  @override
  _TelaCriarContaState createState() => _TelaCriarContaState();
}

class _TelaCriarContaState extends State<TelaCriarConta> {
  // Criação das Variáveis
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Conta"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,

        leading: IconButton(
          icon: const Icon(Icons.refresh),
          tooltip: 'Refresh',
          onPressed: () {
            // Limpando os Dados
            txtNome.text = "";
            txtEmail.text = "";
            txtSenha.text = "";
          },
        ),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              tooltip: 'About',
              icon: const Icon(Icons.info),
              onPressed: (){
                Navigator.pushNamed(context, 'T3');
              },
            ),
          ),
        ],
      ),

      body: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [

            Image.asset(
              'lib/imagens/foto_jogador.png',
              width: 175.0,
              height: 175.0,
              color: Colors.white,
              fit: BoxFit.contain,
            ),

            SizedBox(
              height: 5.0,
            ),

            TextFormField(
              controller: txtNome,

              // Validador do Campo Nome
              validator: (value){
                if(value!.isEmpty) {
                  return "Preencha o Campo";
                }
              },

              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 15.5,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                labelText: "Nome de Usuário",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            TextFormField(
              controller: txtEmail,

              // Validador do Campo E-Mail
              validator: (value){
                if(value!.isEmpty) {
                  return "Preencha o Campo";
                }
              },

              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 15.5,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                labelText: 'E-Mail',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),

            TextFormField(
              obscureText: true,
              controller: txtSenha,

              // Validador do Campo Senha
              validator: (value){
                if(value!.isEmpty) {
                  return "Preencha o Campo";
                }
              },

              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 15.5,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(
              height: 40.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: 150.0,
                  child: OutlinedButton(
                    child: const Text('Criar'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white70,
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: () {
                      criarConta(
                        txtNome.text,
                        txtEmail.text,
                        txtSenha.text,
                      );
                    },
                  ),
                ),

                // ignore: sized_box_for_whitespace
                Container(
                  width: 150.0,
                  child: OutlinedButton(
                    child: const Text('Cancelar'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white70,
                      minimumSize: const Size(100, 50),
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'T1');
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 60.0,
            ),
          ],
        ),
      ),
    );
  }

// Criar Conta no Firebase Auth
void criarConta(nome, email, senha) {
  FirebaseAuth.instance
    .createUserWithEmailAndPassword(email: email, password: senha)
    .then((value) {
      exibirMensagem("Usuário Criado com Sucesso!");
      Navigator.popAndPushNamed(context, 'T2');
    }).catchError((erro) {
      if (erro.code == 'email-already-in-use') {
        exibirMensagem("ERRO: O E-Mail Informado está em Uso.");
      } else if (erro.code == 'invalid-email') {
        exibirMensagem("ERRO: O E-Mail Informado é Inválido.");
      } else {
        exibirMensagem("ERRO: ${erro.message}.");
      }
    });
}

// Exibir Mensagem de Erro
  void exibirMensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}