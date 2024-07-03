import 'package:clean_stock/components/custom_floatingbutton.dart';
import 'package:clean_stock/layouts/home.layout.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:clean_stock/utils/generate_random_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCreatePage extends ConsumerWidget {
  const ProductCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HomeLayout(
      children: Column(
        children: [],
      ),
      floatingButton: CustomFloatingButton(
        onPressed: () {
          final newProduct = generateRandomProduct();
          ref.read(createProductProvider(newProduct).future);
          Navigator.of(context).pop();
        },
        icon: Icons.add,
      ),
    );
  }
}
