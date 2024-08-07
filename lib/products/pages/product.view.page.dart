import 'package:clean_stock/components/custom_floatingbutton.dart';
import 'package:clean_stock/layouts/home.layout.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      titleLastPath: product.name,
      floatingButton: CustomFloatingButton(
        onPressed: () => context.go('/products/$productId/edit'),
        icon: Icons.edit,
      ),
      children: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Name: ${product.name}'),
            Text('Product Price: ${product.price}'),
            Text('Product Description: ${product.description}'),
            Text('Product Category: ${product.category}'),
            Text('Product Manufacturer: ${product.manufacturer}'),
            Text('Product Supplier: ${product.supplier}'),
            Text('Product Quantity: ${product.quantity}'),
            Text('Product Quantity Min: ${product.quantityMin}'),
            Text('Product Quantity Max: ${product.quantityMax}'),
            Text('Product Color: ${product.color}'),
            Text('Product Status: ${product.status}'),
            Text('Product Created At: ${product.createdAt}'),
            Text('Product Updated At: ${product.updatedAt}'),
          ],
        ),
      ),
    );
  }
}
