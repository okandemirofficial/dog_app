// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:models/models.dart';

void main() {
  group('Models', () {
    test('BreedListResponseModel.fromJson test', () {
      const rawJson =
          '''
          {
            "message": {
                "affenpinscher": [],
                "wolfhound": [
                    "irish"
                ]
            },
            "status": "success"
            }
      ''';

      final map = jsonDecode(rawJson);
      final responseModel =
          BreedListResponseModel.fromJson(map as Map<String, dynamic>);

      expect(responseModel, isNotNull);
      expect(responseModel.message['wolfhound']!.first, equals('irish'));
      expect(responseModel.message['affenpinscher']?.length, equals(0));
    });
  });
}
