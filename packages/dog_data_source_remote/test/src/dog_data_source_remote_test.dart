// ignore_for_file: prefer_const_constructors

import 'package:dog_data_source_remote/dog_data_source_remote.dart';
import 'package:flutter_test/flutter_test.dart';

const _baseUrl = 'https://dog.ceo/api/';

void main() {
  group('DogDataSourceRemote', () {
    test('can be instantiated', () {
      expect(DogDataSourceRemote(baseUrl: _baseUrl), isNotNull);
    });

    test('getBreedList is working', () async {
      final dataSorce = DogDataSourceRemote(baseUrl: _baseUrl);
      final breedList = await dataSorce.getBreedList();

      expect(breedList, isNotNull);
    });

    test('getBreedList is working', () async {
      final dataSorce = DogDataSourceRemote(baseUrl: _baseUrl);
      final breedList = await dataSorce.getImageUrlByBreed('african');

      expect(breedList, isNotNull);
    });
  });
}
