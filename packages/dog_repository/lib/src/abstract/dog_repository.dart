import 'package:dog_data_source_abstract/dog_data_source_abstract.dart';
import 'package:models/models.dart';

/// {@template dog_repository}
/// The dog repository to get dogs
/// {@endtemplate}
abstract class DogRepository {
  /// {@macro dog_repository}
  const DogRepository({required this.dogDataSoure});

  ///A data source for dog feature
  final DogDataSource dogDataSoure;

  ///Gets breed list
  Future<List<BreedModel>> getBreedList();
}
