import 'package:dio/dio.dart';
import 'package:dog_data_source_abstract/dog_data_source_abstract.dart';
import 'package:models/models.dart';

typedef FromJsonParser<T> = T Function(Map<String, dynamic> map);

/// {@template dog_data_source_remote}
/// A remote dog data source api
/// {@endtemplate}
final class DogDataSourceRemote extends DogDataSource {
  /// {@macro dog_data_source_remote}
  DogDataSourceRemote({required String baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  late final Dio _dio;

  void _onException(String message) {
    final exception = Exception(message);

    throw exception;
  }

  Future<T> _handleGetRequest<T>(String url, FromJsonParser<T> parser) async {
    final response = await _dio.get<Map<String, dynamic>>(url);

    ///Non success codes
    if ((response.statusCode ?? 404) > 299) {
      _onException(
        '''A get request cannot completed on $url, status code: ${response.statusCode}''',
      );
    }

    if (response.data == null) {
      _onException('''Expected value is null on $url''');
    }

    return parser.call(response.data!);
  }

  @override
  Future<BreedListResponseModel> getBreedList() => _handleGetRequest(
        '/breeds/list/all',
        BreedListResponseModel.fromJson,
      );

  @override
  Future<RandomImageByBreedResponseModel> getImageUrlByBreed(
    String breedName,
  ) =>
      _handleGetRequest(
        '/breed/$breedName/images/random',
        RandomImageByBreedResponseModel.fromJson,
      );
}
