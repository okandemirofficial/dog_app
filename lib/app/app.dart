import 'package:dog_app/feature/home/bloc/home_bloc.dart';
import 'package:dog_app/product/router/router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({
    required this.homeBloc,
    super.key,
  });

  final HomeBloc homeBloc;
  late final routerManager = RouterManager(homeBloc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerManager.router,
    );
  }
}
