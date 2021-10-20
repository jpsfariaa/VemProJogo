import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:navigation_test/widget_area.dart';

class TelaFuncionalidade03 extends StatefulWidget {
  const TelaFuncionalidade03({ Key? key }) : super(key: key);

  @override
  _TelaFuncionalidade03State createState() => _TelaFuncionalidade03State();
}

class _TelaFuncionalidade03State extends State<TelaFuncionalidade03> {
  
  // Variável CheckBox
  bool checkValor = false;
  bool checkValor2 = false;
  bool checkValor3 = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alugar Área Externa"),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 1950,

          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(30.0),

          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: checkValor, 
                            onChanged: (onValue) {
                              setState(() {
                                checkValor = onValue!;
                              });
                            },
                          ),
                          
                          const WidgetArea(
                            'Área da Quadra A', 
                            'Rua A, 120', 
                            '135,00', 
                            'Domingo, 17/10/2021 às 14:00', 
                            '(00) 0000-0000', 
                            'www.quadra.com.br',
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: checkValor2, 
                            onChanged: (onValue) {
                              setState(() {
                                checkValor2 = onValue!;
                              });
                            },
                          ),

                          const WidgetArea(
                            'Área da Quadra B', 
                            'Rua B, 720', 
                            '145,00',
                            'Sábado, 16/10/2021 às 15:45', 
                            '(00) 0000-0000', 
                            'www.quadrab.com.br',
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: checkValor3, 
                            onChanged: (onValue) {
                              setState(() {
                                checkValor3 = onValue!;
                              });
                            },
                          ),

                          const WidgetArea(
                            'Área da Quadra C',
                            'Rua C, 450', 
                            '175,00', 
                            'Sexta, 15/10/2021 às 20:30', 
                            '(00) 0000-0000', 
                            'www.quadrac.com.br',
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 35.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton.icon(
                            icon: const Icon(Icons.paid),
                            label: const Text("Alugar"),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.white60,

                              shadowColor: Colors.black,
                              elevation: 10.0,

                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),

                              minimumSize: const Size(70, 50),
                            ),
                            onPressed: (){
                              setState(() {
                                if (checkValor | checkValor2 | checkValor3 == false) {
                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "ERRO: Selecione no Mínimo 1 Área.",
                                      ),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                } else {
                                  showDialogArea(context);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogArea(BuildContext context) {
    showDialog(context: context, 
      builder: (BuildContext context) {
        AlertDialog dialog = AlertDialog(
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
            "Confirmar Aluguel?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          actions: [
            TextButton(
              child: const Text("Sim"),
              onPressed: (){
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "A Área foi Alugada com Sucesso!",
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
        return dialog;
      },
    );
  }
}