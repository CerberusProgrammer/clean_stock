import 'package:clean_stock/layouts/home.layout.dart';
import 'package:clean_stock/providers/promotions.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(context, ref) {
    final promotions = ref.watch(promotionsProvider);

    return HomeLayout(
      children: Center(
        child: promotions.when(
          data: (data) => Text('$data'),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
