import 'package:clean_stock/models/Category.dart';
import 'package:clean_stock/products/product.dart';
import 'package:clean_stock/providers/user.riverpod.dart';
import 'package:clean_stock/products/product.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testProductProvider = FutureProvider.family<Product, String>(
  (ref, id) async => Product(
    id: int.parse(id),
    name: 'Product $id',
    barcode: '000$id',
    status: true,
    price: 100.0,
    quantity: 10,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    category: Category(
      id: 1,
      name: 'Category 1',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: true,
    ),
  ),
);

final testProductsProvider = FutureProvider<List<Product>>(
  (ref) => [
    Product(
      id: 1,
      name: 'Product 1',
      barcode: '1234567890',
      status: true,
      price: 100.0,
      quantity: 10,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: Category(
        id: 1,
        name: 'Category 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        status: true,
      ),
    ),
    Product(
      id: 2,
      name: 'Product 2',
      barcode: '14562',
      status: true,
      price: 300.0,
      quantity: 4,
      category: Category(
        id: 2,
        name: 'Category 2',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        status: true,
      ),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Product(
      id: 3,
      name: 'Product 3',
      barcode: '14562',
      status: true,
      price: 300.0,
      quantity: 4,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ],
);

final productsProvider = FutureProvider<List<Product>>(
  (ref) async => ProductService.getProducts(
    token: ref.watch(userProvider).token,
  ),
);

final productProvider = FutureProvider.family<Product, String>(
  (ref, id) async => ProductService.getProduct(
    id: id,
    token: ref.watch(userProvider).token,
  ),
);

final createProductProvider = FutureProvider.family<Product, Product>(
  (ref, product) async => ProductService.createProduct(
    product: product,
    token: ref.watch(userProvider).token,
  ),
);

final updateProductProvider = FutureProvider.family<Product, Product>(
  (ref, product) async => ProductService.updateProduct(
    product: product,
    token: ref.watch(userProvider).token,
  ),
);

final deleteProductProvider = FutureProvider.family<void, String>(
  (ref, id) async => ProductService.deleteProduct(
    id: id,
    token: ref.watch(userProvider).token,
  ),
);
