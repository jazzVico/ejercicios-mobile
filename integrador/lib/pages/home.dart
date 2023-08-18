import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integrador/constants/stock.dart';
import 'package:integrador/model/item.dart';
import 'package:integrador/pages/navigation.dart';
import 'package:integrador/widgets/reserva.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final stock = ref.watch(stockProvider).stock;

    return SafeArea(child:
    Scaffold(
      appBar: AppBar(title: const Text('Reservas'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0, right: 8,left: 16),
          child: ListView(
            children: stock.map((reserva) {
              return Reserva(
                  item: reserva,
                  onTap: ()=> Navigation.bookPage(context,reserva)
              );
            }).toList(),
          ),
        ),
        ),
      ),
    );
  }
}


