import 'package:flutter/material.dart';
import 'package:interfaz_estado_cuenta/Controller/controler_interfaz_estado_cuenta.dart';
import 'package:interfaz_estado_cuenta/scr/my_form.dart';
import 'package:interfaz_estado_cuenta/widgets/custom_BuscadorTransacciones.dart';
import 'package:interfaz_estado_cuenta/widgets/custom_TablaTransacciones.dart';

class VentanaCuentaClientes extends StatefulWidget {
  @override
  _VentanaCuentaClientesState createState() => _VentanaCuentaClientesState();
}

class _VentanaCuentaClientesState extends State<VentanaCuentaClientes> {
  String etiqueta = 'Agregar';
  List<Map<String, dynamic>> transaccionesFiltradas = []; // Lista de transacciones filtradas

  @override
  void initState() {
    super.initState();
    // Inicializa transaccionesFiltradas con todasLasTransacciones al inicio
    transaccionesFiltradas = todasLasTransacciones.expand((list) => list).toList();
  }

  void handleSearch(String query) {
    setState(() {
      // Filtra las transacciones según el texto de búsqueda
      transaccionesFiltradas = todasLasTransacciones
          .expand((list) => list)
          .where((transaccion) =>
              transaccion['observacion']
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomBuscadorTransacciones(onSearchSubmitted: handleSearch),
              ),
              ElevatedButton(
                onPressed: () async {
                  final result = await openMyForm(context, etiqueta);
                  if (result == true) {
                    // Actualiza transaccionesFiltradas con todasLasTransacciones
                    setState(() {
                      transaccionesFiltradas = todasLasTransacciones.expand((list) => list).toList();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: const Color.fromARGB(255, 18, 79, 160),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 8),
                    Text('Agregar estado de cuenta', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: CustomTablaTransacciones(transacciones: transaccionesFiltradas),
          ),
        ],
      ),
    );
  }
}