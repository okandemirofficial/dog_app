import 'package:models/src/interface/i_network_model.dart';

///An api response to get breed images
final class RandomImageByBreedResponseModel implements INetworkModel {
  ///A constructor for [RandomImageByBreedResponseModel]
  RandomImageByBreedResponseModel({
    required this.message,
    required this.status,
  });

  ///A from.json for [RandomImageByBreedResponseModel]
  factory RandomImageByBreedResponseModel.fromJson(Map<String, dynamic> json) {
    return RandomImageByBreedResponseModel(
      message: json['message'] as String?,
      status: json['status'] as String?,
    );
  }

  ///Url
  final String? message;

  ///Status
  final String? status;

  ///A copyWith method for [RandomImageByBreedResponseModel]
  RandomImageByBreedResponseModel copyWith({
    String? message,
    String? status,
  }) {
    return RandomImageByBreedResponseModel(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  ///A toJson method for [RandomImageByBreedResponseModel]
  @override
  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
      };
}
