import 'package:flutter/material.dart';
import 'ventana_cuenta_clientes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: VentanaCuentaClientes(),
      ),
    );
  }
}
