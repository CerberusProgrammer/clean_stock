import 'package:clean_stock/products/db/product.hive.dart';
import 'package:clean_stock/products/product.api.dart';
import 'package:clean_stock/products/product.dart';
import 'package:clean_stock/products/product.query.dart';

class ProductService {
  static Future<List<Product>> getProducts({
    required String token,
    ProductQueryParams? queryParams,
  }) async =>
      await ProductHive.getProducts(
        token: token,
        queryParams: queryParams ?? ProductQueryParams(),
      );

  static Future<Product> getProduct({
    required String id,
    required String token,
  }) async =>
      await ProductAPI.getProduct(id: id, token: token);

  static Future<Product> createProduct({
    required Product product,
    required String token,
  }) async =>
      await ProductAPI.createProduct(product: product, token: token);

  static Future<Product> updateProduct({
    required Product product,
    required String token,
  }) async =>
      await ProductAPI.updateProduct(product: product, token: token);

  static Future<void> deleteProduct({
    required String id,
    required String token,
  }) async =>
      await ProductAPI.deleteProduct(id: id, token: token);
}
