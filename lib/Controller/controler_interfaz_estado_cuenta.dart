import 'package:flutter/material.dart';
import 'package:interfaz_estado_cuenta/scr/my_form.dart';


Future<bool> openMyForm(BuildContext context, String etiqueta) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          children: [
            Text(etiqueta, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            MyForm(),
          ],
        ),
      );
    },
  );
  return true;
}

void handleEditarTransaccion(BuildContext context, Map<String, dynamic> transaccion, String etiqueta) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          children: [
            Text(etiqueta, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            MyForm(),
          ],
        ),
      );
    },
  );
}


void _handleEliminarTransaccion(BuildContext context, Map<String, dynamic> transaccion) {
  // Implementa la lógica para eliminar la transacción aquí
  // Puedes mostrar un cuadro de diálogo de confirmación antes de eliminar
}