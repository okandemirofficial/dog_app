import 'package:dog_app/feature/home/bloc/home_bloc.dart';
import 'package:dog_app/product/environment/environment_variables.dart';
import 'package:dog_data_source_abstract/dog_data_source_abstract.dart';
import 'package:dog_data_source_remote/dog_data_source_remote.dart';
import 'package:dog_repository/dog_repository.dart';
import 'package:get_it/get_it.dart';

///A service locator for the project
final locator = GetIt.instance;

/// {@template dependency_injection}
/// A layer to handle dependency injection. Depends on every layer
/// {@endtemplate}
class DependencyInjection {
  /// {@macro dependency_injection}
  const DependencyInjection();

  ///Creates
  static void handleInitialSetup(EnvironmentVariables environmentVariables) {
    locator
      ..registerLazySingleton<DogDataSource>(
        () => DogDataSourceRemote(
          baseUrl: environmentVariables.baseUrl,
        ),
      )
      ..registerLazySingleton<DogRepository>(
        () => DogRepositoryImpl(
          locator<DogDataSource>(),
        ),
      )
      ..registerFactory<HomeBloc>(
        () => HomeBloc(
          locator<DogRepository>(),
        ),
      );
  }
}
