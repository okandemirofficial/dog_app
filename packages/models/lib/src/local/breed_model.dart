// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
final class BreedModel extends Equatable {
  final String name;
  final List<String> subBreedNames;

  final String? breedImageUrl;

  const BreedModel({
    required this.name,
    required this.subBreedNames,
    this.breedImageUrl,
  });

  BreedModel copyWith({
    String? name,
    List<String>? subBreedNames,
    String? breedImageUrl,
  }) {
    return BreedModel(
      name: name ?? this.name,
      subBreedNames: subBreedNames ?? this.subBreedNames,
      breedImageUrl: breedImageUrl ?? this.breedImageUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, subBreedNames, breedImageUrl];
}
