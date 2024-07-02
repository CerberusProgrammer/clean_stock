import 'dart:math';

import 'package:clean_stock/components/custom_textbutton.dart';
import 'package:clean_stock/models/ccategory.dart';
import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/pages/product.sort.page.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:clean_stock/utils/random_string.dart';
import 'package:clean_stock/utils/showfade_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_stock/layouts/home.layout.dart';
import 'package:go_router/go_router.dart';

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
            category: Category(
                id: 1,
                name: 'asd',
                status: false,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now()),
          );
          ref.read(createProductProvider(newProduct).future);
        },
        child: const Icon(Icons.add),
      ),
      children: productsAsyncValue.when(
        data: (_) => Center(
            child: products.isEmpty
                ? const Text('No hay productos disponibles.')
                : Column(children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextButton(
                            icon: Icons.sort,
                            title: 'Sort by',
                            onTap: () => showFadeDialog(
                              context: context,
                              title: 'Sort products by',
                              child: ProductSortPage(
                                categories: products
                                    .map((product) => product.category)
                                    .toList(),
                                manufacturers: products
                                    .map((product) => product.manufacturer)
                                    .toList(),
                                suppliers: products
                                    .map((product) => product.supplier)
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomTextButton(
                            icon: Icons.filter_list,
                            title: 'Filter by',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    ...products.map(
                      (product) => ListTile(
                        title: Text(product.name),
                        subtitle:
                            Text(product.description ?? 'Sin descripción'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => ref.read(
                            deleteProductProvider(product.id).future,
                          ),
                        ),
                        onTap: () => context.go('/products/${product.id}'),
                      ),
                    ),
                  ])),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
