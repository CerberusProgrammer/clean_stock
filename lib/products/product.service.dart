import 'package:clean_stock/products/product.api.dart';
import 'package:clean_stock/products/product.dart';

class ProductService {
  static Future<List<Product>> getProducts({
    required String token,
  }) async =>
      await ProductAPI.getProducts(token: token);

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
