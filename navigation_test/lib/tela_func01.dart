import 'package:flutter/material.dart';

// Tela Funcionalidade 01
class TelaFuncionalidade01 extends StatefulWidget {
  const TelaFuncionalidade01({ Key? key }) : super(key: key);

  @override
  _TelaFuncionalidade01State createState() => _TelaFuncionalidade01State();
}

class _TelaFuncionalidade01State extends State<TelaFuncionalidade01> {
  // Lista Dinâmica para Armazenar os Elementos
  var lista = [];

  // Retornar o Elemento Adicionado pelo Usuário
  var txtElemento = TextEditingController();

  @override
  void initState() {
    lista.add("E aí Craque... Qual é a sua Meta?");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Metas'),
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: Container(
        color: Colors.green.shade700,
        padding: const EdgeInsets.all(30.0),

        // ListView
        child: ListView.builder(
          // Quantidade de Elementos da Lista
          itemCount: lista.length,

          // Aparência dos Elementos
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white54,
              shadowColor: Colors.lightGreenAccent,
              elevation: 15.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),

              child: ListTile(
                title: Text(
                  lista[index],
                  style: const TextStyle(fontSize: 20.0),
                ),
                subtitle: const Text(
                  '#VemProJogo',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  tooltip: "Delete",
                  onPressed: (){
                    setState(() {
                      lista.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "A Meta foi Removida com Sucesso!",
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        tooltip: "Add",
        backgroundColor: Colors.white70,
        focusColor: Colors.black,
        onPressed: () async {
          await showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  "Adicionar Meta",
                  style: TextStyle(fontSize: 16.0),
                ),

                content: TextField(
                  controller: txtElemento,
                  style: const TextStyle(fontSize: 22.0),
                  decoration: const InputDecoration(
                  ),
                ),

                actions: [
                  TextButton(
                    child: const Text("Ok"),
                    onPressed: (){
                      setState(() {
                        var msg = '';
                        if (txtElemento.text.isNotEmpty) {
                          lista.add(txtElemento.text);
                          txtElemento.clear();
                          msg = "A Meta foi Adicionada com Sucesso!";
                        } else {
                          msg = "ERRO: A Descrição da Meta não foi Informada.";
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(msg),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      });
                    },
                  ),

                  TextButton(
                    child: const Text("Cancelar"),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}