import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({ Key? key }) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  // Criação das Variáveis
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Login'),
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.refresh),
          tooltip: 'Refresh',
          onPressed: () {
            // Limpando os Dados
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
        color: Colors.green.shade700,
        padding: const EdgeInsets.all(25.0),
        child: Form(
          child: Center(
            child: Column(
              children: <Widget>[

                Image.asset(
                  'lib/imagens/foto_jogador.png',
                  width: 175.0,
                  height: 175.0,
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),

                const SizedBox(
                  height: 5.0,
                ),

                TextFormField(
                  controller: txtEmail,
                  style: const TextStyle(color: Colors.white),
                  // Validador do Campo - Nome de Usuário
                  validator: (value){
                    if(value!.isEmpty) {
                      return "Preencha o Campo";
                    }
                  },
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: "Nome de Usuário ou E-Mail",
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
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
          
                const SizedBox(
                  height: 10.0,
                ),

                // Padding - Senha
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextFormField(
                    controller: txtSenha,
                    style: const TextStyle(color: Colors.white),

                    // Validador do Campo - Senha
                    validator: (value){
                      if(value!.isEmpty) {
                        return "Preencha o Campo";
                      }
                    },

                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: const TextStyle(color: Colors.white),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: (){
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        child: const Text(
                          "Entrar",
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white70,
                          minimumSize: const Size(100, 50),
                        ),
                        onPressed: (){
                          setState(() {
                            isLoading = true;
                          });
                          userauth(txtEmail.text, txtSenha.text);
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 70.0,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ainda não Possui Conta?",
                      style: TextStyle(
                        color: Colors.white,
                        
                      ),
                    ),

                    SizedBox(
                      height: 10.0,
                    ),
                    
                    Column(
                      children: [
                        OutlinedButton(
                          child: Text(
                            "Criar",
                          ),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Colors.white70,
                            minimumSize: Size(100, 50),
                          ),

                          onPressed: (){
                            Navigator.popAndPushNamed(context, 'T0');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Firebase Auth - Autenticação de Usuário
  void userauth(email, senha) {
    FirebaseAuth.instance.setPersistence(Persistence.SESSION).then((value) {
    FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: senha)
      .then((value) {
        Navigator.pushReplacementNamed(context, 'T2');
      }).catchError((erro) {
        if(erro.code == 'user-not-found') {
          exibirMensagem('ERRO: Usuário não Encontrado.');
        } else if (erro.code == 'wrong-password') {
          exibirMensagem('ERRO: Senha Incorreta.');
        } else if (erro.code == 'invalid-email') {
          exibirMensagem('ERRO: E-Mail Inválido.');
        } else {
          exibirMensagem('ERRO: ${erro.message}.');
        }
      });
    }).catchError((erro) {
      exibirMensagem('ERRO: ${erro.message}.');
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