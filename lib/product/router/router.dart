import 'package:dog_app/feature/home/bloc/home_bloc.dart';
import 'package:dog_app/feature/home/home_view.dart';
import 'package:go_router/go_router.dart';

class RouterManager {
  RouterManager(this.homeBloc);

  final HomeBloc homeBloc;

  late final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeView(homeBloc: homeBloc),
      ),
    ],
  );
}
