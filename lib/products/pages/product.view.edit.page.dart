import 'package:clean_stock/components/clean_textfield.dart';
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
  late TextEditingController _descriptionController;
  late TextEditingController _barcodeController;
  late TextEditingController _weightController;
  late TextEditingController _dimensionController;
  late TextEditingController _expirationDateController;
  late TextEditingController _locationController;
  late TextEditingController _statusController;
  late TextEditingController _priceController;
  late TextEditingController _quantityController;
  late TextEditingController _quantityMinController;
  late TextEditingController _quantityMaxController;
  late TextEditingController _colorController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    product = ref.read(productByIdProvider(widget.productId!));
    _nameController = TextEditingController(text: product?.name ?? '');
    _descriptionController =
        TextEditingController(text: product?.description ?? '');
    _barcodeController = TextEditingController(text: product?.barcode ?? '');
    _weightController =
        TextEditingController(text: product?.weight.toString() ?? '');
    _dimensionController =
        TextEditingController(text: product?.dimension ?? '');
    _expirationDateController =
        TextEditingController(text: product?.expirationDate.toString() ?? '');
    _locationController = TextEditingController(text: product?.location ?? '');
    _statusController =
        TextEditingController(text: product?.status.toString() ?? '');
    _priceController =
        TextEditingController(text: product?.price.toString() ?? '');
    _quantityController =
        TextEditingController(text: product?.quantity.toString() ?? '');
    _quantityMinController =
        TextEditingController(text: product?.quantityMin.toString() ?? '');
    _quantityMaxController =
        TextEditingController(text: product?.quantityMax.toString() ?? '');
    _colorController = TextEditingController(text: product?.color ?? '');
    _categoryController =
        TextEditingController(text: product?.category.toString() ?? '');
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
            CleanTextField(
              controller: _barcodeController,
              labelText: 'Product Barcode',
            ),
            CleanTextField(
              controller: _nameController,
              labelText: 'Product Name',
            ),
            CleanTextField(
              controller: _descriptionController,
              labelText: 'Product Description',
            ),
            CleanTextField(
              controller: _weightController,
              labelText: 'Product Weight',
            ),
            CleanTextField(
              controller: _dimensionController,
              labelText: 'Product Dimension',
            ),
            CleanTextField(
              controller: _expirationDateController,
              labelText: 'Product Expiration Date',
            ),
            CleanTextField(
              controller: _locationController,
              labelText: 'Product Location',
            ),
            CleanTextField(
              controller: _statusController,
              labelText: 'Product Status',
            ),
            CleanTextField(
              controller: _priceController,
              labelText: 'Product Price',
            ),
            CleanTextField(
              controller: _quantityController,
              labelText: 'Product Quantity',
            ),
            CleanTextField(
              controller: _quantityMinController,
              labelText: 'Product Quantity Min',
            ),
            CleanTextField(
              controller: _quantityMaxController,
              labelText: 'Product Quantity Max',
            ),
            CleanTextField(
              controller: _colorController,
              labelText: 'Product Color',
            ),
            CleanTextField(
              controller: _categoryController,
              labelText: 'Product Category',
            ),
          ],
        ),
      ),
    );
  }
}
