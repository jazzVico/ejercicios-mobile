import 'package:integrador/model/reservable.dart';

class Pelicula extends Reservable{
  final int  duration;
  final List<String> actores;

  Pelicula({
    required super.nombre,
    super.devolucionPrevista,
    super.cantidadReservas,
    super.reservadoPor,
    super.diaReservacion,
    super.imagen,
    required this.duration,
    required this.actores,
  });

  @override
  String secondText(){
    return '$nombre, ${duration.toString()} minutos';
  }

  @override
  String thirdText(){
    return  actores.join(',');
  }

  @override
  int creditos(){
    return actores.length * 10;
  }

  @override
  Reservable reservar(String persona){
    //Tiempo de devolución: si la película tarda 2 horas ó más => 5 días, de lo contrario en 3 días
    return Pelicula(
        imagen: imagen,
        nombre: nombre,
        duration: duration,
        actores: actores,
        reservadoPor: persona,
        cantidadReservas: cantidadReservas+1,
        diaReservacion: DateTime.now(),
        devolucionPrevista: duration < 120 ? DateTime.now().add(const Duration(days: 3)) :  DateTime.now().add(const Duration(days: 5))
    );

  }

  @override
  Reservable devolver(){
    return Pelicula(
        nombre: nombre,
        duration: duration,
        actores: actores,
        cantidadReservas: cantidadReservas,
        imagen: imagen
    );
  }

}