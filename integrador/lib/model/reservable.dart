class Reservable {
  final String nombre;
  DateTime? devolucionPrevista;
  int cantidadReservas;
  String? reservadoPor;
  DateTime? diaReservacion;
  String imagen;

  Reservable({
    required this.nombre,
    this.devolucionPrevista,
    this.cantidadReservas = 0,
    this.reservadoPor,
    this.diaReservacion,
    this.imagen = 'assets/images/splash.png'
  });

  @override
  bool operator == (Object otro){
    return
      otro is Reservable &&
          otro.nombre == nombre &&
    otro.reservadoPor == reservadoPor;
  }

  String secondText(){
    return '';
  }

  String thirdText(){
    return '';
  }

  bool isAvailable(){
    return  reservadoPor == null;
  }

  Reservable reservar(String persona){
      throw Exception('no implementado');
  }

  Reservable devolver(){
    throw Exception('no implementado');
  }

  int creditos(){
    throw Exception('no implementado');
  }
}
