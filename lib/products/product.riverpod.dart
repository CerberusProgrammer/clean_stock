import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/models/product.query.dart';
import 'package:clean_stock/providers/user.riverpod.dart';
import 'package:clean_stock/products/product.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsState = StateProvider<List<Product>>((ref) {
  return [];
});

final productsProvider = FutureProvider.autoDispose<List<Product>>((ref) async {
  ref.watch(productsState);
  final products = await ProductService.getProducts(
    queryParams: ProductQueryParams(),
    token: ref.watch(userProvider).token,
  );
  return products;
});

final productProvider = FutureProvider.family.autoDispose<Product, String>(
  (ref, id) async => ProductService.getProduct(
    id: id,
    token: ref.watch(userProvider).token,
  ),
);

final createProductProvider =
    FutureProvider.family.autoDispose<Product, Product>(
  (ref, product) async => ProductService.createProduct(
    product: product,
    token: ref.watch(userProvider).token,
  ),
);

final updateProductProvider =
    FutureProvider.family.autoDispose<Product, Product>(
  (ref, product) async => ProductService.updateProduct(
    product: product,
    token: ref.watch(userProvider).token,
  ),
);

final deleteProductProvider = FutureProvider.family.autoDispose<void, String>(
  (ref, id) async => ProductService.deleteProduct(
    id: id,
    token: ref.watch(userProvider).token,
  ),
);
