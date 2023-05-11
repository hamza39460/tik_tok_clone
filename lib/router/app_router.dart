import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/modules/home/views/home_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  static const String initialRoute = '/';
}
