import 'dart:async';
import 'dart:developer';

import 'package:dependency_injection/dependency_injection.dart';
import 'package:dog_app/app/app_bloc_observer.dart';
import 'package:dog_app/feature/home/bloc/home_bloc.dart';
import 'package:dog_app/product/environment/environment_variables.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
  EnvironmentVariables environmentVariables,
) async {
  //For flutter errors (widget errors etc.)
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(() => _onInit(builder, environmentVariables), _onError);
}

Future<void> _onInit(
  FutureOr<Widget> Function() builder,
  EnvironmentVariables environmentVariables,
) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Prezerves splash screen while we load all assets from network
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();
  DependencyInjection.handleInitialSetup(environmentVariables);

  final bloc = locator<HomeBloc>()..add(HomeInit());

  //Listen state changes
  //We'll close the native splash when everthing is loaded
  final homeBlocSubscription = bloc.stream.listen((state) {});
  await homeBlocSubscription.cancel();

  await builder();
}

///Handles zone error
void _onError(Object error, StackTrace stack) {
  log(error.toString(), stackTrace: stack);
}
