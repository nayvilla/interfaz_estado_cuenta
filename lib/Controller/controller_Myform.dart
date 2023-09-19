import 'package:flutter/material.dart';

void cerrarMyform(BuildContext context,){
  Navigator.of(context).pop();
}
void guardarTransaccion(
  BuildContext context,
  String fechaTransaccion,
  String estadoVenta,
  double debe,
  double haber,
  double saldo,
  String fechaVencimiento,
  String observacion,
  String telefono,
  String correo,
  List<Map<String, dynamic>> transacciones,
  TextEditingController debeController,
  TextEditingController haberController,
  TextEditingController saldoController,
  TextEditingController observacionController,
  TextEditingController telefonoController,
  TextEditingController correoController,
  void Function(void Function()) setStateCallback, List<List<Map<String, dynamic>>> todasLasTransacciones,
) {
  // Crea un mapa con los datos de la transacción
  Map<String, dynamic> transaccion = {
    'fechaTransaccion': fechaTransaccion,
    'estadoVenta': estadoVenta,
    'debe': debe,
    'haber': haber,
    'saldo': saldo,
    'fechaVencimiento': fechaVencimiento,
    'observacion': observacion,
    'telefono': telefono,
    'correo': correo,
  };

  // Crea una nueva lista para esta transacción
  List<Map<String, dynamic>> nuevaTransaccion = [transaccion];

  // Agrega la transacción a la lista de transacciones
  transacciones.add(transaccion);

  // Agrega la nueva transacción a la lista de todas las transacciones
  todasLasTransacciones.add(nuevaTransaccion);

  // Imprime la transacción en la consola
  print("Nueva Transacción:");
  print(transaccion);
  print(todasLasTransacciones);

  // Limpia los campos del formulario
  limpiarCampos(
    debeController,
    haberController,
    saldoController,
    observacionController,
    telefonoController,
    correoController,
    setStateCallback,
  );

  // Cierra la ventana actual del formulario
  Navigator.of(context).pop();
}


void limpiarCampos(
  TextEditingController debeController,
  TextEditingController haberController,
  TextEditingController saldoController,
  TextEditingController observacionController,
  TextEditingController telefonoController,
  TextEditingController correoController,
  void Function(void Function()) setStateCallback,
) {
  // Limpia los valores de los controladores
  debeController.clear();
  haberController.clear();
  saldoController.clear();
  observacionController.clear();
  telefonoController.clear();
  correoController.clear();

  // Llama a setState para actualizar la UI
  setStateCallback(() {});
}
