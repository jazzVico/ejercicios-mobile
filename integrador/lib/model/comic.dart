import 'package:integrador/extensions/date-format.dart';
import 'package:integrador/model/reservable.dart';


//En la descripción va el nombre de la revista, el número y la fecha de salida
class Comic extends Reservable{
  final int numero;
  final DateTime fechaSalida;

  Comic({
    required super.nombre,
    super.cantidadReservas,
    super.reservadoPor,
    super.diaReservacion,
    super.devolucionPrevista,
    super.imagen,
    required this.numero,
    required this.fechaSalida
  });

  @override
  secondText(){
    return '$numero, ${dateFormat(fechaSalida)}';
  }

  @override
  int creditos() {
   return nombre.length * 3;
  }

  @override
  Reservable reservar(String persona){
    //si la revista es anterior a 1980, 2 días, entre 1980 y anterior al 2000, 3 días o 5 días en caso contrario
    DateTime devolucion = fechaSalida.year < 1980 ? DateTime.now().add(const Duration(days: 2))
        : (fechaSalida.year <2000 ? DateTime.now().add(const Duration(days: 3)) : DateTime.now().add(const Duration(days: 5)));
    return Comic(
        nombre: nombre,
        numero: numero,
        fechaSalida: fechaSalida,
        cantidadReservas: cantidadReservas +1,
        reservadoPor: persona,
        diaReservacion: DateTime.now(),
        devolucionPrevista: devolucion
    );
  }

  @override
  Reservable devolver(){
    return Comic(
        nombre: nombre,
        numero: numero,
        fechaSalida: fechaSalida,
        cantidadReservas: cantidadReservas,
    );
  }
}