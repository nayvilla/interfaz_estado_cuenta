// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

String obtenerFechaActual() {
  final now = DateTime.now();
  final formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(now);
}

class Constants {
  static const bool light = true;
  static const String selectedEstadoVenta = 'Sin Pagar';
  static const String etiqueta = 'Agregar';
  static String? fechaTransaccion;
  static String? fechaVencimiento;
  static String fechaActual = obtenerFechaActual();
  static final List<String> metodoPagoOptions = ['Efectivo', 'Tarjeta', 'Transferencia'];
  static final List<String> estadoVentaOptions = ['Sin Pagar', 'Pagado', 'Pago parcial'];
}

class buscar {
  dynamic setState;
  final bool inBar = true;

}

class Transaccion {
  final int id_estado_cuenta;
  final DateTime fecha;
  final String descripcion;
  final double debe;
  final double haber;
  final double saldo;
  final DateTime fechaVencimiento;
  final String estado;
  final String numeroContacto;
  final String correo;
  final String observacion;
    final String etiqueta_Myform;
  //final dynamic acciones;

  Transaccion({
    required this.id_estado_cuenta,
    required this.fecha,
    required this.descripcion,
    required this.debe,
    required this.haber,
    required this.saldo,
    required this.fechaVencimiento,
    required this.estado,
    required this.numeroContacto,
    required this.correo,
    required this.observacion,
    required this.etiqueta_Myform,
    //required this.acciones,
  });
}
