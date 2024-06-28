import 'package:clean_stock/core/domain/db/data_sql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:clean_stock/products/product.dart';
import 'package:clean_stock/products/product.query.dart';

class ProductSQL {
  static Future<List<Product>> getProducts({
    required String token,
    required ProductQueryParams queryParams,
  }) async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(join(dbPath, database));

    String sql = 'SELECT * FROM $databaseTableProducts WHERE 1=1';
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
      sql += ' AND manufacturer = ?';
      arguments.add(queryParams.manufacturer);
    }
    if (queryParams.supplier != null) {
      sql += ' AND supplier = ?';
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
      sql += ' AND category = ?';
      arguments.add(queryParams.category);
    }
    if (queryParams.createdAt != null) {
      sql += ' AND created_at = ?';
      arguments.add(queryParams.createdAt);
    }

    final List<Map<String, dynamic>> queryResult =
        await db.rawQuery(sql, arguments);

    await db.close();

    return queryResult.map((e) => Product.fromJson(e)).toList();
  }

  static Future<Product> createProduct({
    required String token,
    required Product product,
  }) async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(join(dbPath, database));

    final Map<String, dynamic> productMap = product.toJson();
    productMap.remove('id');

    final int id = await db.insert(databaseTableProducts, productMap);

    await db.close();

    return product.copyWith(id: id);
  }

  static Future<Product> updateProduct({
    required String token,
    required Product product,
  }) async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(join(dbPath, database));

    final Map<String, dynamic> productMap = product.toJson();

    await db.update(
      databaseTableProducts,
      productMap,
      where: 'id = ?',
      whereArgs: [product.id],
    );

    await db.close();

    return product;
  }

  static Future<void> deleteProduct({
    required String token,
    required Product product,
  }) async {
    final dbPath = await getDatabasesPath();
    final db = await openDatabase(join(dbPath, database));

    await db.delete(
      databaseTableProducts,
      where: 'id = ?',
      whereArgs: [product.id],
    );

    await db.close();
  }
}
