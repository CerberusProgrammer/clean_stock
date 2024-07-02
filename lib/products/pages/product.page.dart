import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_stock/layouts/home.layout.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(productsInitializationProvider));
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsNotifierProvider);

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
              id: DateTime.now().millisecondsSinceEpoch,
              name: 'Nuevo Producto',
              price: 0,
              description: 'Descripción del producto',
              barcode: '',
              status: false,
              quantity: 10,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now());
          ref.read(createProductProvider(newProduct).future);
        },
        child: Icon(Icons.add),
      ),
      children: Text('$products'),
    );
  }
}
