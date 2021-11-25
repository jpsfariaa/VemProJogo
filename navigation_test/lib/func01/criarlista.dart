import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:navigation_test/main.dart';

class TesteFunc01 extends StatefulWidget {
  const TesteFunc01({ Key? key }) : super(key: key);

  @override
  _TesteFunc01State createState() => _TesteFunc01State();
}

class _TesteFunc01State extends State<TesteFunc01> {

  var txtTitulo = TextEditingController();
  var txtSubtitulo = TextEditingController();

  // Retornar um Único Documento a Partir do ID
  getDocumentById(id) async {
    await FirebaseFirestore.instance.collection('elementos')
      .doc(id).get().then((doc) {
        txtTitulo.text = doc.get('titulo');
        txtSubtitulo.text = doc.get('subtitulo');
      });
  }

  @override
  Widget build(BuildContext context) {

    // Recuperar o ID do Elemento que foi Selecionado pelo Usuário
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if(txtTitulo.text.isEmpty && txtSubtitulo.text.isEmpty) {
        getDocumentById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Listagem de Metas"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,

        leading: IconButton(
          tooltip: 'Disconnect',
          icon: Icon(Icons.close),

          onPressed: (){
            alertDialog02(context);
          },
        ),

        actions: <Widget> [
          Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: IconButton(
              tooltip: 'About',
              icon: Icon(Icons.info),

              onPressed: (){
                alertDialog(context);
              },
            ),
          ),
        ],
      ),

      backgroundColor: Colors.green.shade700,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 500.0,

          padding: EdgeInsets.all(30.0),
          child: ListView(
            children: [
              TextField(
                controller: txtTitulo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Nome da Meta',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),

              TextField(
                controller: txtSubtitulo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 150.0,
                    
                    child: OutlinedButton(
                      child: Text(
                        "Salvar",
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white70,
                        minimumSize: const Size(100, 50),
                      ),
                                         
                      onPressed: (){
                        if (id == null) {
                          // Adicionar um Novo Documento
                          FirebaseFirestore.instance.collection("elementos").add({
                            'titulo' : txtTitulo.text,
                            'subtitulo' : txtSubtitulo.text,
                          });
                        } else {
                          // Atualizar um Documento Existente
                          FirebaseFirestore.instance.collection("elementos").doc(id.toString()).set({
                            'titulo' : txtTitulo.text,
                            'subtitulo' : txtSubtitulo.text,
                          });
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Operação Realizada com Sucesso!",
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );

                        Navigator.pop(context);
                      },
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 150.0,
                    child: OutlinedButton(
                      child: Text(
                        "Cancelar",
                      ),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white70,
                        minimumSize: const Size(100, 50),
                      ),

                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}