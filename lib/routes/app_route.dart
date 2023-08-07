import 'package:go_router/go_router.dart';
import 'package:guild_test_joke/features/joke/presentation/screens/joke_page.dart';

class AppRoute {
  factory AppRoute() {
    return _instance;
  }

  AppRoute._internal() {
    _routerInstance = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) {
            return JokePage();
          },
        ),
      ],
    );
  }

  static final AppRoute _instance = AppRoute._internal();

  late GoRouter _routerInstance;

  GoRouter config() {
    return _routerInstance;
  }
}
