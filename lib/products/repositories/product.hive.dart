import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/models/product.query.dart';
import 'package:hive/hive.dart';

class ProductHive {
  static Future<Box<Product>> getProductsBox() =>
      Hive.openBox<Product>('products');

  static Future<List<Product>> getProducts({
    required String token,
    required ProductQueryParams queryParams,
  }) async {
    try {
      final box = await getProductsBox();
      final List<Product> products = box.values.toList();

      return products.where((product) {
        final isNameMatch =
            queryParams.name != null ? product.name == queryParams.name : true;
        final isDescriptionMatch = queryParams.description != null
            ? product.description == queryParams.description
            : true;
        final isBarcodeMatch = queryParams.barcode != null
            ? product.barcode == queryParams.barcode
            : true;
        final isWeightMatch = queryParams.weight != null
            ? product.weight == queryParams.weight
            : true;
        final isDimensionMatch = queryParams.dimension != null
            ? product.dimension == queryParams.dimension
            : true;
        final isLocationMatch = queryParams.location != null
            ? product.location == queryParams.location
            : true;

        return isNameMatch &&
            isDescriptionMatch &&
            isBarcodeMatch &&
            isWeightMatch &&
            isDimensionMatch &&
            isLocationMatch;
      }).toList();
    } catch (e) {
      throw Exception('Failed to get products: $e');
    }
  }

  static Future<Product?> getProductById(String id) async {
    final box = await getProductsBox();
    final product = box.values.firstWhere((product) => product.id == id);

    return product;
  }

  static Future<Product> addProduct({required Product product}) async {
    final box = await getProductsBox();
    final key = await box.add(product);
    final addedProduct = box.get(key);

    return addedProduct!;
  }

  static Future<Product> updateProduct(Product product) async {
    final box = await getProductsBox();
    final key = box.keys.firstWhere((key) => box.get(key)!.id == product.id);
    await box.put(key, product);

    return product;
  }

  static Future<void> deleteProduct(String id) async {
    final box = await getProductsBox();
    final key = box.keys.firstWhere((key) => box.get(key)!.id == id);
    await box.delete(key);
  }

  static Future<void> deleteAllProducts() async {
    final box = await getProductsBox();
    await box.clear();
  }
}
