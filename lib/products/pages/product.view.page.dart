import 'package:clean_stock/layouts/home.layout.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductViewPage extends ConsumerWidget {
  const ProductViewPage({super.key, required this.productId});

  final String? productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (productId == null) {
      return const HomeLayout(
        children: Center(
          child: Text('No product ID provided'),
        ),
      );
    }

    final product = ref.watch(productByIdProvider(productId!));

    if (product == null) {
      return const HomeLayout(
        children: Center(
          child: Text('Product not found'),
        ),
      );
    }

    return HomeLayout(
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product ID: ${product.id}'),
          Text('Product Name: ${product.name}'),
          Text('Product Price: ${product.price}'),
          Text('Product Description: ${product.description}'),
        ],
      ),
    );
  }
}
