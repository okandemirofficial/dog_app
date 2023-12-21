// ignore_for_file: avoid_unused_constructor_parameters

///A base model for the network request
abstract interface class INetworkModel {
  ///A fromJson method for the requests
  INetworkModel.fromJson(Map<String, dynamic> map);

  ///A toJson method for the requests
  Map<String, dynamic> toJson();
}
