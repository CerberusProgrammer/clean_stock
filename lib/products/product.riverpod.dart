import 'package:clean_stock/products/product.dart';
import 'package:clean_stock/providers/user.riverpod.dart';
import 'package:clean_stock/products/product.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
