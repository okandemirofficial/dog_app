import 'package:models/models.dart';

/// {@template dog_data_source_abstract}
/// An abstract data source for dog api
/// {@endtemplate}
abstract class DogDataSource {
  /// {@macro dog_data_source_abstract}
  const DogDataSource({this.onError});

  ///On error callback on executed data source request
  final void Function(Exception exception)? onError;

  ///Gets breed list from data source
  Future<BreedListResponseModel> getBreedList();

  ///Gets breed list from data source
  Future<RandomImageByBreedResponseModel> getImageUrlByBreed(String breedName);
}
