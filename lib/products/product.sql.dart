import 'package:clean_stock/core/domain/db/data_sql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:clean_stock/products/product.dart';
import 'package:clean_stock/products/product.query.dart';

class ProductSQL {
  static Future<List<Product>> getProducts({
    required ProductQueryParams queryParams,
  }) async {
    final Database db = await initializeDB();

    String sql = 'SELECT * FROM products WHERE 1=1';
    List<dynamic> arguments = [];

    if (queryParams.name != null) {
      sql += ' AND name = ?';
      arguments.add(queryParams.name);
    }
    if (queryParams.description != null) {
      sql += ' AND description = ?';
      arguments.add(queryParams.description);
    }
    if (queryParams.barcode != null) {
      sql += ' AND barcode = ?';
      arguments.add(queryParams.barcode);
    }
    if (queryParams.weight != null) {
      sql += ' AND weight = ?';
      arguments.add(queryParams.weight);
    }
    if (queryParams.dimension != null) {
      sql += ' AND dimension = ?';
      arguments.add(queryParams.dimension);
    }
    if (queryParams.expirationDate != null) {
      sql += ' AND expiration_date = ?';
      arguments.add(queryParams.expirationDate);
    }
    if (queryParams.location != null) {
      sql += ' AND location = ?';
      arguments.add(queryParams.location);
    }
    if (queryParams.manufacturer != null) {
      sql += ' AND manufacturer_id = ?';
      arguments.add(queryParams.manufacturer);
    }
    if (queryParams.supplier != null) {
      sql += ' AND supplier_id = ?';
      arguments.add(queryParams.supplier);
    }
    if (queryParams.status != null) {
      sql += ' AND status = ?';
      arguments.add(queryParams.status);
    }
    if (queryParams.price != null) {
      sql += ' AND price = ?';
      arguments.add(queryParams.price);
    }
    if (queryParams.quantity != null) {
      sql += ' AND quantity = ?';
      arguments.add(queryParams.quantity);
    }
    if (queryParams.category != null) {
      sql += ' AND category_id = ?';
      arguments.add(queryParams.category);
    }
    if (queryParams.createdAt != null) {
      sql += ' AND created_at = ?';
      arguments.add(queryParams.createdAt);
    }

    final List<Map<String, dynamic>> queryResult =
        await db.rawQuery(sql, arguments);

    List<Product> products =
        queryResult.map((e) => Product.fromSQL(e)).toList();

    return products;
  }

  static Future<Product> createProduct({
    required Product product,
  }) async {
    final Database db = await initializeDB();

    final Map<String, dynamic> productMap = product.toJsonForSQL();
    final int id = await db.insert(
      'products',
      productMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return product.copyWith(id: id);
  }

  static Future<Product> updateProduct({
    required Product product,
  }) async {
    final Database db = await initializeDB();

    final Map<String, dynamic> productMap = product.toJsonForSQL();

    await db.update(
      'products',
      productMap,
      where: 'id = ?',
      whereArgs: [product.id],
    );

    return product;
  }

  static Future<void> deleteProduct({
    required Product product,
  }) async {
    final Database db = await initializeDB();

    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }
}
