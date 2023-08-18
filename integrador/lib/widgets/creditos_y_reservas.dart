import 'package:flutter/material.dart';
import 'package:integrador/widgets/iconWithString.dart';

class CreditosYReservas extends StatelessWidget {
   int creditos;
   int cantidadReservas;

  CreditosYReservas({Key? key, required this.creditos, required this.cantidadReservas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconWithString(text: cantidadReservas.toString(), icon: Icons.book_outlined ),
        ),
        IconWithString(text: creditos.toString(), icon: Icons.confirmation_num_outlined),
      ],);
  }
}
