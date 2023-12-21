import 'package:dog_data_source_abstract/dog_data_source_abstract.dart';
import 'package:dog_repository/dog_repository.dart';
import 'package:models/models.dart';

///A concrete implementation for dogRepository
final class DogRepositoryImpl implements DogRepository {
  ///A constructor for [DogRepositoryImpl]
  const DogRepositoryImpl(this._dogDataSource);

  final DogDataSource _dogDataSource;

  @override
  Future<List<BreedModel>> getBreedList() async {
    final response = await _dogDataSource.getBreedList();

    final list = <BreedModel>[];

    for (final key in response.message.keys) {
      final model =
          BreedModel(name: key, subBreedNames: response.message[key] ?? []);
      list.add(model);
    }

    return list;
  }

  @override
  Future<String> getImageUrlByBreed(String breedName) async {
    final response = await _dogDataSource.getImageUrlByBreed(breedName);

    if (response.message == null) {
      throw Exception('Url is null');
    }

    return response.message!;
  }
}
