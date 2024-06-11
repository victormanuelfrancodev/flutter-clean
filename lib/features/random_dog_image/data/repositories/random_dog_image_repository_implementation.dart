import 'package:cleanarchitecture/core/result/failure/failure.dart';
import 'package:cleanarchitecture/core/result/result.dart';
import 'package:cleanarchitecture/features/random_dog_image/data/datasources/random_dog_image_remote_datasources.dart';
import 'package:cleanarchitecture/features/random_dog_image/domain/entities/random_dog_image.dart';
import 'package:cleanarchitecture/features/random_dog_image/domain/repositories/random_dog_image_repository.dart';

class RandomDogImageRepositoryImplementation implements RandomDogImageRepository{
  
  const RandomDogImageRepositoryImplementation({
    required RandomDogImageRemoteDataSource randomDogImageRemoteDataSource,
  }): _randomDogImageRemoteDataSource = randomDogImageRemoteDataSource;

  final RandomDogImageRemoteDataSource _randomDogImageRemoteDataSource;
  
  @override
  Future<Result<DogImage, Failure>> getRandomDogImageUrl() async{
    try{
      final dogImage = await _randomDogImageRemoteDataSource.getRandomDogImageUrl();
      return Success(dogImage);
    }catch(e){
      return Error(Failure("Failed to load data"));
    } 
  }
}