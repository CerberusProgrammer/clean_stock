import 'package:clean_stock/layouts/home.layout.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductViewPage extends ConsumerWidget {
  const ProductViewPage({super.key, required this.productId});

  final String? productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (productId != null) {
      final product = ref.watch(productProvider(productId!));

      return HomeLayout(
        children: product.when(
          data: (data) => ListView(
            children: [
              Text('Product ID: ${data.id}'),
              Text('Product Name: ${data.name}'),
              Text('Product Price: ${data.price}'),
              Text('Product Description: ${data.description}'),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text('Error: $error'),
          ),
        ),
      );
    }

    return const HomeLayout(children: Text('error'));
  }
}
