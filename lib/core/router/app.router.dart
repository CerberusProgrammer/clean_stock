import 'package:clean_stock/pages/home.page.dart';
import 'package:clean_stock/pages/settings.page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, route) => const HomePage(),
      routes: [
        GoRoute(
          path: 'settings',
          name: 'settings',
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: SettingsPage());
          },
        )
      ],
    )
  ],
);
