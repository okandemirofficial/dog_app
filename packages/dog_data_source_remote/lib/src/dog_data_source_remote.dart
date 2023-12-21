import 'package:dio/dio.dart';
import 'package:dog_data_source_abstract/dog_data_source_abstract.dart';
import 'package:models/src/response/breed_list_response_model.dart';

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

  Future<T> _handleGetRequest<T>(String url) async {
    final response = await _dio.get<T>(url);

    ///Non success codes
    if ((response.statusCode ?? 404) > 299) {
      _onException(
        '''A get request cannot completed on $url, status code: ${response.statusCode}''',
      );
    }

    if (response.data == null) {
      _onException('''Expected value is null on $url''');
    }

    return response.data!;
  }

  @override
  Future<BreedListResponseModel> getBreedList() =>
      _handleGetRequest('/breeds/list/all');
}
