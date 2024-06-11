import 'package:cleanarchitecture/core/result/result.dart';
import 'package:cleanarchitecture/features/random_dog_image/domain/entities/random_dog_image.dart';
import 'package:cleanarchitecture/features/random_dog_image/domain/repositories/random_dog_image_repository.dart';
import 'package:flutter/material.dart';

sealed class RandomDogImageState {}

class IntialState extends RandomDogImageState {}

class LoadingState extends RandomDogImageState {}

class LoadedState extends RandomDogImageState {
  LoadedState({
    required this.dogImage,
  });
  final DogImage dogImage;
}

class FailureState extends RandomDogImageState {}

class RandomDogImageNotifier extends ChangeNotifier {
  RandomDogImageNotifier(
      {required RandomDogImageRepository randomDogImageRepository})
      : _randomDogImageRepository = randomDogImageRepository,
        randomDogImageState = IntialState();

  final RandomDogImageRepository _randomDogImageRepository;
  RandomDogImageState randomDogImageState;

  void generateRandomImage() async {
    randomDogImageState = LoadingState();
    notifyListeners();

    final result = await _randomDogImageRepository.getRandomDogImageUrl();
    if (result is Success) {
      randomDogImageState = LoadedState(dogImage: (result as Success).value);
      notifyListeners();
      return;
    }

    randomDogImageState = FailureState();
    notifyListeners();
  }
}
