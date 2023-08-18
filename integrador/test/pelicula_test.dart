import 'package:integrador/model/libro.dart';
import 'package:test/test.dart';

void main(){
  test('cuando se reserva se guarda la persona', (){
    final libro = Libro(nombre: 'un libro', creditos: 1, author: 'un autor');
    libro.reservar('persona');
    expect(libro.reservadoPor, 'persona');
  });

  test('cuando se reserva aumenta la cantidad de reservas', (){
    final libro = Libro(nombre: 'un libro', creditos: 1, author: 'un autor');
    final cantReservas = libro.cantidadReservas;
    libro.reservar('persona');
    expect(libro.cantidadReservas, cantReservas+1);
  });

  /*test('cuando se reserva se setea en hoy la fecha de reserva y una semana despues la de devolucion', (){
    final libro = Libro(nombre: 'un libro', creditos: 1, author: 'un autor');
    final cantReservas = libro.cantidadReservas;
    libro.reservar('persona');
    expect(libro.diaReservacion, DateTime.now().);
    expect(libro.devolucionPrevista, DateTime.now().add(const Duration(days: 7)));
  });*/

  test( 'No se puede reservar pelicula reservada',(){
    final libro = Libro(
        nombre: 'un libro',
        creditos: 4,
        author: 'un autor',
        reservadoPor: 'una persona',
        diaReservacion: DateTime(2023,7,3),
        devolucionPrevista: DateTime(2023,7,26),
        cantidadReservas: 1
    );

    final reservar = (){
      libro.reservar('otra perona');
    };
    expect(reservar, throwsException);
    expect(libro.reservadoPor, 'una persona');
    expect(libro.cantidadReservas, 1);
  }
  );

  test( 'No se puede devolver pelicula no reservada',(){
        final libro = Libro(
            nombre: 'un libro',
            creditos: 4,
            author: 'un autor',
        );

        final devolver = (){
          libro.devolver();
        };
        expect(devolver, throwsException);
      }
  );
}