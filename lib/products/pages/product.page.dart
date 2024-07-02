import 'dart:math';

import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:clean_stock/utils/random_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_stock/layouts/home.layout.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(productsInitializationProvider);

    final products = ref.watch(productsNotifierProvider);
    final productsAsyncValue = ref.watch(productsInitializationProvider);

    return HomeLayout(
      floatingButton: FloatingActionButton(
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        enableFeedback: true,
        highlightElevation: 0,
        onPressed: () async {
          final newProduct = Product(
            id: Random().nextInt(1000000),
            name: getRandomString(10),
            price: Random().nextDouble() * 100,
            description: getRandomString(20),
            barcode: getRandomString(6),
            status: Random().nextBool(),
            quantity: Random().nextInt(100),
            createdAt:
                DateTime.now().subtract(Duration(days: Random().nextInt(365))),
            updatedAt:
                DateTime.now().subtract(Duration(days: Random().nextInt(365))),
          );
          ref.read(createProductProvider(newProduct).future);
        },
        child: const Icon(Icons.add),
      ),
      children: productsAsyncValue.when(
        data: (_) => Center(
            child: products.isEmpty
                ? const Text('No hay productos disponibles.')
                : Column(
                    children: products
                        .map((product) => ListTile(
                            title: Text(product.name),
                            subtitle:
                                Text(product.description ?? 'Sin descripción'),
                            trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => ref.read(
                                    deleteProductProvider(product.id).future))))
                        .toList(),
                  )),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
