import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integrador/constants/generos.dart';
import 'package:integrador/model/comic.dart';
import 'package:integrador/model/libro.dart';
import 'package:integrador/model/pelicula.dart';
import 'package:integrador/model/item.dart';

/*final  List<StateProvider<Reservable>> stock = [
 StateProvider((ref) => Pelicula(nombre: 'The godfather', duration: 300, actores: ['Marlon Brando','Al Pacino','James Caan'], imagen: 'assets/images/godfather.jpeg')),
 StateProvider( (ref) => Libro(nombre: 'The design of everyday thing', author: 'Don Norman', cantidadReservas: 40, genero: Generos.manual)),
 StateProvider( (ref) => Libro(nombre: '1984', author: 'George Orwell', cantidadReservas: 123, genero: Generos.ficcion )),
 StateProvider( (ref) => Pelicula(nombre: 'Lo que el viento se llevo', cantidadReservas: 10, duration: 238, actores: ['Vivien Leigh', 'Clark Gable'] )),
 StateProvider( (ref) => Libro(nombre: 'Cien años de soledad', author: 'Gabriel Garcia Marquez', cantidadReservas: 4, genero: Generos.realismoMagico )),
 StateProvider( (ref) => Libro(nombre: 'Baño de damas', author: 'Natalia Rozenblum', cantidadReservas: 400, genero: Generos.ficcion )),
 StateProvider((ref) => Comic(nombre: 'Sandman', numero: 54, fechaSalida: DateTime.utc(1989, 11, 9))),
 StateProvider( (ref) => Libro(nombre: 'Alicia en el pais de las maravillas', author: 'Lewis Carroll', cantidadReservas: 200, genero: Generos.ficcion )),
 StateProvider( (ref) => Pelicula(nombre: 'Relatos salvajes', cantidadReservas: 40, duration: 180, actores: ['Darío Grandinetti', 'María Marull', 'Mónica Villa'])),
 StateProvider( (ref) => Libro(nombre: 'Las venas abiertas de America Latina', author: 'Edwardo Galeano', cantidadReservas: 30, genero: Generos.historia)),
 StateProvider( (ref) => Pelicula(nombre: 'Tango Feroz', cantidadReservas: 40, duration: 120, actores: ['Fernán Mirás','Cecilia Dopazo','Imanol Arias'] )),
 StateProvider( (ref) => Pelicula(nombre: 'Mi vecino totoro', cantidadReservas: 60, duration: 130, actores: ['Hitoshi Takagi', 'Noriko Hidaka', 'Chika Sakamoto'] )),
];*/

class ReservableNotifier extends ChangeNotifier {
 List<Item> stock = [
  Pelicula(nombre: 'The godfather', duration: 300, actores: ['Marlon Brando','Al Pacino','James Caan'], imagen: 'assets/images/godfather.jpeg'),
  Libro(nombre: 'The design of everyday thing', author: 'Don Norman', cantidadReservas: 40, genero: Generos.manual),
  Libro(nombre: '1984', author: 'George Orwell', cantidadReservas: 123, genero: Generos.ficcion ),
  Pelicula(nombre: 'Lo que el viento se llevo', cantidadReservas: 10, duration: 238, actores: ['Vivien Leigh', 'Clark Gable'] ),
  Libro(nombre: 'Cien años de soledad', author: 'Gabriel Garcia Marquez', cantidadReservas: 4, genero: Generos.realismoMagico ),
  Libro(nombre: 'Baño de damas', author: 'Natalia Rozenblum', cantidadReservas: 400, genero: Generos.ficcion ),
  Comic(nombre: 'Sandman', numero: 54, fechaSalida: DateTime.utc(1989, 11, 9)),
  Libro(nombre: 'Alicia en el pais de las maravillas', author: 'Lewis Carroll', cantidadReservas: 200, genero: Generos.ficcion ),
  Pelicula(nombre: 'Relatos salvajes', cantidadReservas: 40, duration: 180, actores: ['Darío Grandinetti', 'María Marull', 'Mónica Villa']),
  Libro(nombre: 'Las venas abiertas de America Latina', author: 'Edwardo Galeano', cantidadReservas: 30, genero: Generos.historia),
  Pelicula(nombre: 'Tango Feroz', cantidadReservas: 40, duration: 120, actores: ['Fernán Mirás','Cecilia Dopazo','Imanol Arias'] ),
  Pelicula(nombre: 'Mi vecino totoro', cantidadReservas: 60, duration: 130, actores: ['Hitoshi Takagi', 'Noriko Hidaka', 'Chika Sakamoto'] ),
 ];


 void reservar(Item item, String persona) {
  item.reservar(persona);
  notifyListeners();
 }

 void devolver(Item item) {
  item.devolver();
  notifyListeners();
 }
}



final stockProvider = ChangeNotifierProvider<ReservableNotifier>((ref) => ReservableNotifier());

