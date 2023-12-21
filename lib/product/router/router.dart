import 'package:dog_app/feature/home/bloc/home_bloc.dart';
import 'package:dog_app/feature/home/home_view.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeView(
        homeBloc: state.extra! as HomeBloc,
      ),
    ),
  ],
);
