import 'package:models/models.dart';

/// {@template dog_repository}
/// The dog repository to get dogs
/// {@endtemplate}
abstract interface class DogRepository {
  /// {@macro dog_repository}
  const DogRepository();

  ///Gets breed list
  Future<List<BreedModel>> getBreedList();

  ///Gets image url as a string by breed name
  Future<String> getImageUrlByBreed(String breedName);
}
