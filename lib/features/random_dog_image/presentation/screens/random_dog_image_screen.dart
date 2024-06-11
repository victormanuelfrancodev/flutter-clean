import 'package:cleanarchitecture/features/random_dog_image/data/datasources/random_dog_image_api_datasource.dart';
import 'package:cleanarchitecture/features/random_dog_image/data/repositories/random_dog_image_repository_implementation.dart';
import 'package:cleanarchitecture/features/random_dog_image/presentation/notifiers/random_dog_image_notifier.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RandomDogImageScreen extends StatefulWidget {
  RandomDogImageScreen({super.key});

  @override
  State<RandomDogImageScreen> createState() => _RandomDogImageScreenState();
}

class _RandomDogImageScreenState extends State<RandomDogImageScreen> {
  final _randomDogDataSource = RandomDogImageNotifier(
    randomDogImageRepository: RandomDogImageRepositoryImplementation(
      randomDogImageRemoteDataSource: RandomDogImageApiDataSource(
        dio: Dio(),
      )
    ),
  );

  @override
  void initState() {
    _randomDogDataSource.generateRandomImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Dog Image'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Add navigation logic here
          },
          child: ListenableBuilder(
            listenable: _randomDogDataSource,
            builder: (context, child){
            return switch(_randomDogDataSource.randomDogImageState){
               IntialState() => const SizedBox(),
               LoadingState() => const CircularProgressIndicator(),
               LoadedState(dogImage:final dogImage) =>  Column(
                children: [
                  Image.network(dogImage.message),
                  ElevatedButton(
                    onPressed: () {
                      _randomDogDataSource.generateRandomImage();
                      setState(() {});
                    },
                    child: const Text('Generate Random Image'),
                  ),],
               ),
               FailureState() => const Text('Failed to load data')
            };
          },),
        ),
      ),
    );
  }
}