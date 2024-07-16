import 'package:clean_stock/products/repositories/product.hive.dart';
import 'package:clean_stock/products/repositories/product.api.dart';
import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/models/product.query.dart';

class ProductService {
  static Future<List<Product>> getProducts({
    required String token,
    ProductQueryParams? queryParams,
  }) async {
    return await ProductHive.getProducts(
      token: token,
      queryParams: queryParams ?? ProductQueryParams(),
    );
  }

  static Future<Product> getProduct({
    required String id,
    required String token,
  }) async =>
      await ProductAPI.getProduct(id: id, token: token);

  static Future<Product> createProduct({
    required Product product,
    required String token,
  }) async =>
      await ProductHive.addProduct(product: product);

  static Future<Product> updateProduct({
    required Product product,
  }) async =>
      await ProductHive.updateProduct(product: product);

  static Future<void> deleteProduct({
    required String id,
    required String token,
  }) async =>
      await ProductHive.deleteProduct(id);
}
