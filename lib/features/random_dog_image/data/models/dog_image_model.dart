
import 'package:cleanarchitecture/features/random_dog_image/domain/entities/random_dog_image.dart';

class DogImageModel extends DogImage{
 const DogImageModel({
    required super.message,
    required super.status,
 });

 factory DogImageModel.fromJson(Map<String, dynamic> json) {
    return DogImageModel(
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
    };
  }
}