import 'package:integrador/constants/generos.dart';
import 'package:integrador/model/reservable.dart';

class Libro extends Reservable{
  final String author;

  final String genero;

  Libro({
    required super.nombre,
    super.devolucionPrevista,
    super.cantidadReservas,
    super.reservadoPor,
    super.diaReservacion,
    super.imagen,
    required this.author,
    required this.genero
  });

  @override
  String secondText(){
    return author;
  }

  @override
  Reservable reservar(String persona) {
    return Libro(
        nombre: nombre,
        author: author,
        reservadoPor: persona,
        diaReservacion: DateTime.now(),
        devolucionPrevista: DateTime.now().add(const Duration(days: 7)),
        cantidadReservas: cantidadReservas + 1,
        genero: genero,
    );
  }

  @override
  Reservable devovler(){
    return Libro(
        nombre: nombre,
        author: author,
        genero: genero,
        cantidadReservas: cantidadReservas,
    );
  }

  @override
  int creditos() {
    return generos[genero]!;
  }
}