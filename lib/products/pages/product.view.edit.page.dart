import 'package:clean_stock/components/custom_floatingbutton.dart';
import 'package:clean_stock/layouts/home.layout.dart';
import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductViewEditPage extends ConsumerStatefulWidget {
  const ProductViewEditPage({super.key, required this.productId});
  final String? productId;

  @override
  createState() => _ProductViewEditPageState();
}

class _ProductViewEditPageState extends ConsumerState<ProductViewEditPage> {
  Product? product;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    product = ref.read(productByIdProvider(widget.productId!));
    _nameController = TextEditingController(text: product?.name ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _updateProduct() async {
    if (_formKey.currentState!.validate()) {
      final updatedProduct = Product(
        id: widget.productId!,
        name: _nameController.text,
        barcode: '',
        status: false,
        price: 0,
        quantity: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      ref.read(updateProductProvider(updatedProduct).future);

      context.go('/products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      titleLastPath: 'dit Product',
      forceIdName: product?.name,
      floatingButton: CustomFloatingButton(
        onPressed: _updateProduct,
        icon: Icons.done,
      ),
      children: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a product name';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
