import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:navigation_test/main.dart';

class ListFunc01 extends StatefulWidget {
  const ListFunc01({ Key? key }) : super(key: key);

  @override
  _ListFunc01State createState() => _ListFunc01State();
}

class _ListFunc01State extends State<ListFunc01> {
  // Criação das Variáveis
  // ignore: prefer_typing_uninitialized_variables
  var elementos;

  @override
  void initState() {
    super.initState();

    elementos = FirebaseFirestore.instance.collection("elementos");
  }

  exibirItemColecao(item) {
    String titulo = item.data()['titulo'];
    String subtitulo = item.data()['subtitulo'];

    return ListTile(
      title: Text(
        titulo,
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),

      subtitle: Text(
        subtitulo,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
        ),
      ),

      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: (){
          // Apagar o Documento
          elementos.doc(item.id).delete();
        },
      ),

      onTap: (){
        Navigator.pushNamed(context, 'T7', arguments: item.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,

      appBar: AppBar(
        title: Text(
          "Listagem de Metas",
        ),

        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        automaticallyImplyLeading: false,

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              alertDialog02(context);
            },
          ),
        ],
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: elementos.snapshots(),

        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text(
                  "Não foi Possível Conectar ao Firestore.",
                ),
              );

            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );

            default:
              final dados = snapshot.requireData;
              return ListView.builder(
                itemCount: dados.size,
                itemBuilder: (context, index) {
                  return exibirItemColecao(dados.docs[index]);
                },
              );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green.shade700,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, 'T7');
        },
      ),
    );
  }
}