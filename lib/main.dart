import 'package:clean_stock/core/router/app.router.dart';
import 'package:clean_stock/core/theme/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Clean Stock',
      theme: ref.watch(themeProvider),
      routerConfig: appRouter,
    );
  }
}
