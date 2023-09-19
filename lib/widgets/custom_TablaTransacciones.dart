import 'package:flutter/material.dart';
import 'package:interfaz_estado_cuenta/Controller/controler_interfaz_estado_cuenta.dart';

class CustomTablaTransacciones extends StatelessWidget {
  final List<Map<String, dynamic>> transacciones;

  CustomTablaTransacciones({required this.transacciones});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.black,
              ),
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Fecha Transacción')),
                  DataColumn(label: Text('Descripción')),
                  DataColumn(label: Text('Debe')),
                  DataColumn(label: Text('Haber')),
                  DataColumn(label: Text('Saldo')),
                  DataColumn(label: Text('Fecha Vencimiento')),
                  DataColumn(label: Text('Estado')),
                  DataColumn(label: Text('Número de Contacto')),
                  DataColumn(label: Text('Correo')),
                  DataColumn(label: Text('Acciones')),
                ],
                rows: transacciones.map((transaccion) {
                  return DataRow(
                    cells: [
                      DataCell(Text(transaccion['id'].toString())),
                      DataCell(Text(transaccion['fecha'].toString())),
                      DataCell(Text(transaccion['descripcion'])),
                      DataCell(Text(transaccion['debe'].toString())),
                      DataCell(Text(transaccion['haber'].toString())),
                      DataCell(Text(transaccion['saldo'].toString())),
                      DataCell(Text(transaccion['fechaVencimiento'].toString())),
                      DataCell(Text(transaccion['estado'])),
                      DataCell(Text(transaccion['numeroContacto'])),
                      DataCell(Text(transaccion['correo'])),
                      DataCell(
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // Lógica para la acción de "Editar" aquí
                                handleEditarTransaccion(context, transaccion, "Editar");
                              },
                              child: Icon(Icons.edit),
                            ),
                            SizedBox(width: 8.0),
                            InkWell(
                              onTap: () {
                                // Lógica para la acción de "Eliminar" aquí
                                _handleEliminarTransaccion(context, transaccion);
                              },
                              child: Icon(Icons.delete),
                            ),
                            SizedBox(width: 8.0),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  void _handleEliminarTransaccion(BuildContext context, Map<String, dynamic> transaccion) {
    // Implementa la lógica para eliminar la transacción aquí
    // Puedes mostrar un cuadro de diálogo de confirmación antes de eliminar
  }
}
