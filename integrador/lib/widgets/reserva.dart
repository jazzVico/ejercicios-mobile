import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integrador/model/reservable.dart';
import 'package:integrador/widgets/iconWithString.dart';

import '../extensions/date-format.dart';

class Reserva extends ConsumerWidget {
  final Reservable item;
  final VoidCallback onTap;

  const Reserva({Key? key,
    required this.onTap,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return  DecoratedBox(
      decoration: const BoxDecoration(
        border: Border( bottom: BorderSide(width: 1,color: Colors.grey) )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text('"${item.nombre}", ${item.secondText()}'),
                      ),
                      item.isAvailable()?
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: IconWithString(
                              icon: Icons.calendar_month,
                            text: 'Disponible',
                          ),
                        )
                      :
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: IconWithString(
                                    text: 'Reservado por ${item.reservadoPor} el ${dateFormat(item.diaReservacion!)}',
                                    icon: Icons.calendar_month
                                ),
                              ),
                              IconWithString(
                                  text: 'Devolucion prevista: ${dateFormat(item.devolucionPrevista!)}',
                                  icon: Icons.check_circle_outline
                              ),
                            ],
                          )
                    ],
                  ),
                  Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 32),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: IconWithString(text: item.cantidadReservas.toString(), icon: Icons.book_outlined ),
                      ),
                      IconWithString(text: item.creditos().toString(), icon: Icons.confirmation_num_outlined, color: item.creditos() > 500 ? Colors.red : Colors.blue),
                  ],),
                ),
              ],),
            ),
            IconButton(icon: const Icon(Icons.navigate_next, size: 50,), onPressed: onTap,)
          ],
        ),
      ),
    );
  }
}