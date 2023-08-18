import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integrador/constants/clientes.dart';
import 'package:integrador/extensions/date-format.dart';
import 'package:integrador/model/reservable.dart';
import 'package:integrador/widgets/creditos_y_reservas.dart';
import 'package:integrador/widgets/iconWithString.dart';

class DetailPage extends ConsumerStatefulWidget {

  const DetailPage({Key? key}) : super(key: key);

  @override
  BookPageState createState() => BookPageState();
}

class BookPageState extends ConsumerState<DetailPage> {
  String reservarPor = clients.first;

  @override
  Widget build(BuildContext context) {
    StateProvider<Reservable> itemProvider = ModalRoute.of(context)!.settings.arguments as StateProvider<Reservable>;
    Reservable item = ref.watch(itemProvider);

    void action(){
      if(item.isAvailable()){
        ref.read(itemProvider.notifier).state = item.reservar(reservarPor);
      }
      else{
        ref.read(itemProvider.notifier).state = item.devolver();
      }
      setState(() {
        reservarPor = clients.first;
      });
    }

    return  SafeArea(
        child: Scaffold(
          appBar:  AppBar(
            backgroundColor: Colors.grey,
            title: Text(item.nombre, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
            leading: BackButton(
              color: Colors.black,
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage(item.imagen), height: 250, alignment: Alignment.topCenter,),
              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 20),
                child: Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(item.secondText(), style: Theme.of(context).textTheme.titleMedium,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(item.thirdText()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        item.isAvailable()? IconWithString(text: 'Disponible', icon: Icons.calendar_month): Container(),
                        CreditosYReservas(creditos:item.creditos(), cantidadReservas: item.cantidadReservas)
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:8.0, bottom: 16, right: 8, left: 8),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.account_circle_outlined),
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: item.isAvailable() ?
                          DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10),
                            onChanged: (String? s){
                              setState(() {
                                reservarPor = s!;
                              });
                            },
                            value: reservarPor,
                            items: clients.map<DropdownMenuItem<String>>((String client) => DropdownMenuItem(value: client, child: Text(client,)) ).toList(),
                            isExpanded: true,
                            selectedItemBuilder: (BuildContext context)=>clients.map<Widget>((String client) =>  Align(alignment: Alignment.center,child: Text(client, textAlign: TextAlign.center,)) ).toList(),
                          ) :
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('reservado por: ${item.reservadoPor}'),
                          ),
                        )
                        )
                      ],

                    ),
                    item.isAvailable() ?
                    Container() :
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: IconWithString(text: 'Devolucion prevista:${dateFormat(item.devolucionPrevista!)}', icon: Icons.check_circle_outline),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: TextButton(
                        onPressed: action,
                        child: Text(item.isAvailable() ? 'prestar' : 'devolver', style: Theme.of(context).textTheme.titleMedium,),
                      )
                    ),
                  ]
                ),
              ),
              const Expanded(
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image(image: AssetImage('assets/images/film.png'),
                        )))
            ],
          ),
        ));
  }
}
