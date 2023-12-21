import 'package:dog_app/feature/home/home_view.dart';
import 'package:go_router/go_router.dart';

class RouterManager {
  RouterManager();

  late final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
