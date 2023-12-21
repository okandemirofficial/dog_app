import 'package:dog_repository/dog_repository.dart';
import 'package:models/models.dart';

///A concrete implementation for dogRepository
final class DogRepositoryImpl extends DogRepository {
  ///A constructor for [DogRepositoryImpl]
  const DogRepositoryImpl({required super.dogDataSoure});

  @override
  Future<List<BreedModel>> getBreedList() async {
    final response = await dogDataSoure.getBreedList();

    final list = <BreedModel>[];

    for (final key in response.message.keys) {
      final model =
          BreedModel(name: key, subBreedNames: response.message[key] ?? []);
      list.add(model);
    }
 
    return list;
  }
}
