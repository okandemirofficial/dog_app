import 'package:models/src/interface/i_network_model.dart';

///Breed list raw response model
final class BreedListResponseModel implements INetworkModel {
  ///A default constructor for [BreedListResponseModel]
  const BreedListResponseModel({
    required this.message,
    required this.status,
  });

  ///From json method for [BreedListResponseModel]
  factory BreedListResponseModel.fromJson(Map<String, dynamic> json) {
    return BreedListResponseModel(
      message: Map<String, List<dynamic>?>.from(
        json['message'] as Map<dynamic, dynamic>,
      ).map(
        (k, v) => MapEntry(
          k,
          v == null ? [] : List.from(v.map((x) => x)),
        ),
      ),
      status: json['status'] as String?,
    );
  }

  ///A breed list
  final Map<String, List<String>> message;

  ///Response status
  final String? status;

  ///CopyWith method for [BreedListResponseModel]
  BreedListResponseModel copyWith({
    Map<String, List<String>>? message,
    String? status,
  }) {
    return BreedListResponseModel(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  ///ToJson method for [BreedListResponseModel]
  @override
  Map<String, dynamic> toJson() => {
        'message': Map<String, List<String>>.from(message).map(
          (k, v) => MapEntry<String, dynamic>(k, v.map((x) => x).toList()),
        ),
        'status': status,
      };
}
