import 'package:flutter/material.dart';
import 'package:interfaz_estado_cuenta/Variables/constants.dart';
import 'package:interfaz_estado_cuenta/widgets/custom_text_field.dart'; // Importa el widget personalizado
import 'package:interfaz_estado_cuenta/widgets/custom_switch_with_label.dart'; // Importa el widget personalizado
import 'package:interfaz_estado_cuenta/widgets/custom_dropdown.dart'; // Importa el widget personalizado
import 'package:interfaz_estado_cuenta/widgets/custom_date_input.dart'; // Importa el widget personalizado
import 'package:interfaz_estado_cuenta/Controller/controller_Myform.dart'; // Importa el widget personalizado



class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}


List<List<Map<String, dynamic>>> todasLasTransacciones = [];

class _MyFormState extends State<MyForm> {
  // Accede a las constantes definidas en constants.dart
  bool light = Constants.light;
  String etiqueta = Constants.etiqueta;
  String selectedEstadoVenta = Constants.selectedEstadoVenta;
  String? _fechaTransaccion = Constants.fechaActual;
  String? _fechaVencimiento = Constants.fechaActual;
  //List<String> metodoPagoOptions = Constants.metodoPagoOptions;
  List<String> estadoVentaOptions = Constants.estadoVentaOptions;
  List<Map<String, dynamic>> transacciones = [];
  TextEditingController debeC = TextEditingController();
  TextEditingController haberC = TextEditingController();
  TextEditingController saldoC = TextEditingController();
  TextEditingController observacionC = TextEditingController();
  TextEditingController telefonoC = TextEditingController();
  TextEditingController correoC = TextEditingController();

@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Fila 1: Fecha de Transacción y Estado de Venta
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customDateInput(
                      'Fecha Transacción',
                      'Seleccione la fecha de transacción',
                      _fechaTransaccion,
                      (String? value) {
                        setState(() {
                          _fechaTransaccion = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customDropdown('Estado de Venta', estadoVentaOptions, selectedEstadoVenta, (String? value) {
                      setState(() {
                        selectedEstadoVenta = value ?? "";
                      });
                    }),
                  ),
                ),
              ],
            ),
            // Fila 2: Debe, Haber y Saldo
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customNumericTextField('Debe', 'Ingrese el debe', 10, controller: debeC,),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customNumericTextField('Haber', 'Ingrese el haber', 10, controller: haberC,),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customNumericTextField('Saldo', 'Saldo calculado', 10, controller: saldoC,),
                  ),
                ),
              ],
            ),
            // Fila 3: Fecha de Vencimiento y Observación
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customDateInput(
                      'Fecha Vencimiento',
                      'Seleccione la fecha de vencimiento',
                      _fechaVencimiento,
                      (String? value) {
                        setState(() {
                          _fechaVencimiento = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customTextField('Observación', 'Ingrese cualquier observación', 20, controller: observacionC),
                  ),
                ),
              ],
            ),
            // Fila 4: Teléfono celular 1 y Correo Electrónico
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customNumericTextField('Teléfono celular', 'Ingrese el número de teléfono del cliente', 10, controller:telefonoC),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: customTextField('Correo electrónico', 'Ingrese el correo del cliente', 20, controller:correoC),
                  ),
                ),
              ],
            ),
            // Agregar etiquetas, interruptor y botones
            customSwitchWithLabel('Estado', light, (bool value) {
              setState(() {
                light = value;
              });
            }),
            Container(
              margin: const EdgeInsets.only(top: 20),
              constraints: const BoxConstraints(
                maxWidth: 770,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cerrarMyform(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: const Color.fromARGB(255, 18, 79, 160),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text('Cancelar', style: TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Llama a la función guardarTransaccion de FormManager para manejar el botón de guardar
                      guardarTransaccion(
                          context,
                          _fechaTransaccion ?? "",
                          selectedEstadoVenta,
                          double.tryParse(debeC.text) ?? 0.0,
                          double.tryParse(haberC.text) ?? 0.0,
                          double.tryParse(saldoC.text) ?? 0.0,
                          _fechaVencimiento ?? "",
                          observacionC.text,
                          telefonoC.text,
                          correoC.text,
                          transacciones,
                          
                          debeC,
                          haberC,
                          saldoC,
                          observacionC,
                          telefonoC,
                          correoC,
                          setState,
                          todasLasTransacciones,
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: const Color.fromARGB(255, 18, 79, 160),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Text('Guardar', style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


}

  