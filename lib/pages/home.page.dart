import 'package:clean_stock/layouts/home.layout.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(productsInitializationProvider);

    final products = ref.watch(productsNotifierProvider);
    final productsAsyncValue = ref.watch(productsInitializationProvider);

    return HomeLayout(
      children: productsAsyncValue.when(
        data: (_) => Center(
            child: products.isEmpty
                ? const Text('No hay productos disponibles.')
                : Column(
                    children: products
                        .map(
                          (p) => Column(
                            children: [
                              Text(p.id),
                              Text(p.barcode),
                              Text(p.name),
                              Text(p.price.toString()),
                            ],
                          ),
                        )
                        .toList(),
                  )),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
