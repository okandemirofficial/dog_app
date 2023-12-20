// ignore_for_file: prefer_const_constructors

import 'package:dog_repository/dog_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DogRepository', () {
    test('can be instantiated', () {
      expect(DogRepository(), isNotNull);
    });
  });
}
