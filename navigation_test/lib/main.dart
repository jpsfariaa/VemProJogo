import 'package:flutter/material.dart';
import 'package:navigation_test/widget_showfunc.dart';
import 'tela_func01.dart';
import 'tela_func02.dart';
import 'tela_func03.dart';
import 'widget_sobre.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),

      // Rotas
      initialRoute: 'T1',
      routes: {
        'T1' : (context) => const TelaPrincipal(),
        'T2' : (context) => const TelaSecundaria(),
        'T3' : (context) => const TelaSobre(),
        'T4' : (context) => const TelaFuncionalidade01(),
        'T5' : (context) => const TelaFuncionalidade02(),
        'T6' : (context) => const TelaFuncionalidade03(),
      },
    ),
  );
}

// Dados
class Dados {
  final String username;
  final String password;
  Dados(this.username, this.password);
}

// Tela Principal
class TelaPrincipal extends StatefulWidget {

  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Global Key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Criação das Variáveis
  var username = TextEditingController();
  var password = TextEditingController();

  bool isObscure = true;

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
            username.text = "";
            password.text = "";
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
          key: formKey, 
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
                  controller: username,
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
                    controller: password,
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
                            if (formKey.currentState!.validate()){
                              var obj = Dados(
                                username.text,
                                password.text,
                              );
                              Navigator.pushNamed(context, 'T2', arguments: obj);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// AlertDialog
void alertDialog(BuildContext context) {
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
          "Alerta!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: const Text(
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

// Tela Secundária
class TelaSecundaria extends StatelessWidget {
  const TelaSecundaria({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Recuperar os Dados
    final Dados obj = ModalRoute.of(context)!.settings.arguments as Dados;

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
          width: double.infinity,
          height: 1350,

          color: Colors.green.shade700,
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Olá, ",
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )
                  ),
                  
                  Text(
                    obj.username,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  
                  const Text(
                    " seja Bem-Vindo(a)!",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
      
                  const SizedBox(
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