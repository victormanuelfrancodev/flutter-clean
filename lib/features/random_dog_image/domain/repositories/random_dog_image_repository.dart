
import 'package:cleanarchitecture/core/result/failure/failure.dart';
import 'package:cleanarchitecture/core/result/result.dart';
import 'package:cleanarchitecture/features/random_dog_image/domain/entities/random_dog_image.dart';

abstract class RandomDogImageRepository{
  Future<Result<DogImage, Failure>> getRandomDogImageUrl();
}