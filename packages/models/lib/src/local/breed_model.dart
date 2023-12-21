// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
final class BreedModel extends Equatable {
  final String name;
  final List<String> subBreedNames;

  const BreedModel({
    required this.name,
    required this.subBreedNames,
  });

  BreedModel copyWith({
    String? name,
    List<String>? subBreedNames,
  }) {
    return BreedModel(
      name: name ?? this.name,
      subBreedNames: subBreedNames ?? this.subBreedNames,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'subBreedNames': subBreedNames,
    };
  }

  factory BreedModel.fromMap(Map<String, dynamic> map) {
    return BreedModel(
      name: map['name'] as String,
      subBreedNames: List<String>.from(
        map['subBreedNames'] as List<String>,
      ),
    );
  }

  factory BreedModel.fromJson(String source) =>
      BreedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, subBreedNames];
}
