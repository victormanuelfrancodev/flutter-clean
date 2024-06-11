
import 'package:cleanarchitecture/features/random_dog_image/data/datasources/random_dog_image_remote_datasources.dart';
import 'package:cleanarchitecture/features/random_dog_image/data/models/dog_image_model.dart';
import 'package:dio/dio.dart';

class RandomDogImageApiDataSource implements RandomDogImageRemoteDataSource{

  const RandomDogImageApiDataSource({
    required Dio dio,
  }): _dio = dio;

  final Dio _dio;
  
  @override
  Future<DogImageModel> getRandomDogImageUrl() async{
    try{
      final response = await _dio.get('https://dog.ceo/api/breeds/image/random');
      if(response.statusCode == 200){
        return DogImageModel.fromJson(response.data);
      }
      throw Exception("Failed to load data");
    }catch(e){
      throw Exception();
    }
  }
}