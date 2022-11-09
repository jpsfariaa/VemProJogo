import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_test/main.dart';

class WidgetQuadras extends StatelessWidget {

  // Componentes Quadra
  final String nomequadra;
  final String endquadra;
  final String valorquadra;
  final String horarioquadra;
  final String telefonequadra;
  final String sitequadra;

  const WidgetQuadras(
    this.nomequadra, 
    this.endquadra, 
    this.valorquadra, 
    this.horarioquadra,
    this.telefonequadra,
    this.sitequadra,
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

      width: MediaQuery.of(context).size.width,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nomequadra,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(
            height: 2.0,
          ),

          Image.asset(
            'lib/imagens/foto_quadras.png',
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
                    endquadra,
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
                        valorquadra + " Reais",
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
                        horarioquadra,
                        style: const TextStyle(
                          fontSize: 15.0,
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
                        telefonequadra,
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
                        sitequadra,
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

              OutlinedButton.icon(
                icon: const Icon(
                  Icons.paid,
                ),

                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.white54,
                  minimumSize: const Size(22.5, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.5)),
                  ),
                ),

                label: const Text(
                  "Reservar",
                ),

                onPressed: (){
                  alertDialogQuadra(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}