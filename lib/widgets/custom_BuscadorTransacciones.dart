import 'package:flutter/material.dart';

class CustomBuscadorTransacciones extends StatelessWidget {
  final void Function(String) onSearchSubmitted;

  CustomBuscadorTransacciones({required this.onSearchSubmitted});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
    child: Container(
      padding: EdgeInsets.all(16.0),
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: TextField(
        onChanged: onSearchSubmitted,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(119, 163, 243, 1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromRGBO(119, 163, 243, 1)),
          ),
          hintText: 'Buscar cliente...',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    ));
  }
}
