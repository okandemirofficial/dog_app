// ignore_for_file: prefer_const_constructors

import 'package:dog_data_source_remote/dog_data_source_remote.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DogDataSourceRemote', () {
    test('can be instantiated', () {
      expect(DogDataSourceRemote(baseUrl: 'https://dog.ceo/api/'), isNotNull);
    });
  });
}
