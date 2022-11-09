import 'package:flutter/material.dart';

class WidgetArea extends StatelessWidget {
  // Componentes
  final String nomearea;
  final String endarea;
  final String valorarea;
  final String hrarea;
  final String telefonearea;
  final String sitearea;

  const WidgetArea(
    this.nomearea,
    this.endarea,
    this.valorarea,
    this.hrarea,
    this.telefonearea,
    this.sitearea,

    { Key? key }) : super(key: key
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      padding: const EdgeInsets.all(30.0),

      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),

        borderRadius: const BorderRadius.all(
          Radius.circular(15.0),
        ),

        color: Colors.white54,
      ),

      width: MediaQuery.of(context).size.width * .70,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nomearea,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(
            height: 2.0,
          ),

          Image.asset(
            'lib/imagens/foto_alugar.png',
            width: 150.0,
            height: 150.0,
            color: Colors.black,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),

          const SizedBox(
            height: 2.0,
          ),

          Column(
            children: [
              const SizedBox(
                height: 7.5,
              ),

              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.location_pin),
                    iconSize: 22.5,
                    onPressed: (){},
                    alignment: Alignment.centerLeft,
                    color: Colors.black,
                    tooltip: "Address",
                  ),

                  Text(
                    endarea,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.attach_money),
                        iconSize: 22.5,
                        onPressed: (){},
                        alignment: Alignment.centerLeft,
                        color: Colors.black,
                        tooltip: "Price",
                      ),

                      Text(
                        valorarea + " Reais",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
                
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.access_time),
                        iconSize: 22.5,
                        onPressed: (){},
                        alignment: Alignment.centerLeft,
                        color: Colors.black,
                        tooltip: "Access Time",
                      ),

                      Text(
                        hrarea,
                        style: const TextStyle(
                          fontSize: 13.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.contact_phone),
                        iconSize: 22.5,
                        onPressed: (){},
                        alignment: Alignment.centerLeft,
                        color: Colors.black,
                        tooltip: "Contact Phone",
                      ),

                      Text(
                        telefonearea,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.public),
                        iconSize: 22.5,
                        onPressed: (){},
                        alignment: Alignment.centerLeft,
                        color: Colors.black,
                        tooltip: "Website",
                      ),

                      Text(
                        sitearea,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}