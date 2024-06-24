import 'package:clean_stock/layouts/home.layout.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, route) => const HomeLayout(),
  )
]);
