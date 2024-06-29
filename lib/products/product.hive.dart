import 'package:clean_stock/products/product.model.hive.dart';
import 'package:hive/hive.dart';

class ProductHive {
  static Box<Product> getProductsBox() => Hive.box<Product>('products');

  static Future<List<Product>> getProducts({
    String? name,
    String? description,
    String? barcode,
    double? weight,
    String? dimension,
    DateTime? expirationDate,
    String? location,
    String? manufacturer,
  }) async {
    final box = getProductsBox();
    final List<Product> products = box.values.toList();

    return products.where((product) {
      final isNameMatch = name != null ? product.name == name : true;
      final isDescriptionMatch =
          description != null ? product.description == description : true;
      final isBarcodeMatch =
          barcode != null ? product.barcode == barcode : true;
      final isWeightMatch = weight != null ? product.weight == weight : true;
      final isDimensionMatch =
          dimension != null ? product.dimension == dimension : true;
      final isExpirationDateMatch = expirationDate != null
          ? product.expirationDate == expirationDate
          : true;
      final isLocationMatch =
          location != null ? product.location == location : true;
      final isManufacturerMatch = manufacturer != null
          ? product.manufacturer?.toString() == manufacturer
          : true;

      return isNameMatch &&
          isDescriptionMatch &&
          isBarcodeMatch &&
          isWeightMatch &&
          isDimensionMatch &&
          isExpirationDateMatch &&
          isLocationMatch &&
          isManufacturerMatch;
    }).toList();
  }
}
