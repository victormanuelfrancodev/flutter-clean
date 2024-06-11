


import 'package:cleanarchitecture/features/random_dog_image/domain/entities/random_dog_image.dart';

abstract class RandomDogImageRemoteDataSource{
  Future<DogImage> getRandomDogImageUrl();
}