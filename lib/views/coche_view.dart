import 'package:flutter/material.dart';
import '../controllers/coches_controller.dart';
import 'detalles_coches.dart';

class CochesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CochesViewState();
}

class CochesViewState extends State<CochesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coches Disponibles'),
        backgroundColor: Colors.pinkAccent.shade100, // Fondo del AppBar rosado pastel
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: CochesController.coches.length,
        itemBuilder: (context, index) {
          final item = CochesController.coches[index];

          return GestureDetector(
            onTap: () {
              // Navegar a otra pantalla con navigator
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleCocheView(item: item),
                ),
              );
            },
            child: Card(
              color: Colors.pink.shade50, // Fondo de las tarjetas rosado pastel
              elevation: 3.0,
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(item.imagen),
                    Divider(color: Colors.pinkAccent.shade100), // Divider rosado pastel
                    Text(
                      '${item.modelo}',
                      style: TextStyle(
                        color: Colors.pinkAccent, // Texto del modelo en rosado
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${item.nombre}',
                      style: TextStyle(
                        color: Colors.grey.shade600, // Texto de la marca en gris suave
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
