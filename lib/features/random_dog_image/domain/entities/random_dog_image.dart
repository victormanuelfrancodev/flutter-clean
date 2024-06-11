//Se hace la conexion entre data y domain, en domain no se define ninguna logica, es dependiente a
//las acciones que se hacen en data.  
class DogImage {
  const DogImage({
    required this.message,
    required this.status,
  });

  final String message;
  final String status;
}
