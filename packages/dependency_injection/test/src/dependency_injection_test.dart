// ignore_for_file: prefer_const_constructors

import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DependencyInjection', () {
    test('can be instantiated', () {
      expect(DependencyInjection(), isNotNull);
    });
  });
}
