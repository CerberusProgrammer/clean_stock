import 'package:clean_stock/products/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> initializeDB() async {
  String path = await getDatabasesPath();
  String dbPath = join(path, 'database.db');

  bool dbExists = await databaseExists(dbPath);

  if (dbExists) {
    await deleteDatabase(dbPath);
  }

  return openDatabase(
    dbPath,
    onCreate: (database, version) async {
      await database.execute(
        """
        CREATE TABLE products(
            id INTEGER PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            description TEXT,
            barcode VARCHAR(255) NOT NULL,
            weight REAL,
            dimension VARCHAR(255),
            expiration_date TEXT,
            location VARCHAR(255),
            manufacturer TEXT,
            supplier TEXT,
            icon VARCHAR(255),
            image VARCHAR(255),
            status INTEGER NOT NULL,
            price REAL NOT NULL,
            quantity INTEGER NOT NULL,
            quantity_min INTEGER,
            quantity_max INTEGER,
            color VARCHAR(255),
            category TEXT,
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL 
        )""",
      );
    },
    version: 1,
  );
}

Future<void> insertProduct(Database db, Product product) async {
  await db.insert(
    'products',
    product.toJsonForSQL(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group('Database Tests', () {
    test('Database creation', () async {
      final db = await initializeDB();
      expect(db, isNotNull);
    });

    test('Table existence', () async {
      final db = await initializeDB();
      const tableName = 'products';
      final tables = await db.rawQuery(
          "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
          [tableName]);
      expect(tables.isNotEmpty, true);
    });
  });

  test('Insert product using raw SQL', () async {
    final db = await initializeDB();

    await db.execute("""
    INSERT INTO products (
      id, name, description, barcode, weight, dimension, expiration_date,
      location, manufacturer, supplier, icon, image, status, price,
      quantity, quantity_min, quantity_max, color, category, created_at, updated_at
    ) VALUES (
      9, 'Test Product', 'This is a test product description.', '123456789', 1.0,
      '10x20x30', '2023-12-31', 'Aisle 4', 'Test Manufacturer', 'Test Supplier',
      'icon.png', 'image.png', 1, 9.99, 100, 10, 200, 'Red', 'Electronics',
      '2023-04-01', '2023-04-01'
    )
  """);

    final List<Map<String, dynamic>> products = await db.query('products');
    expect(products.first['name'], 'Test Product');

    await db.close();
  });

  test('Insert product using Product object with only required parameters',
      () async {
    final db = await initializeDB();

    var newProduct = Product(
      id: 6,
      name: 'Test Product',
      description: 'This is a test product.',
      price: 9.99,
      barcode: 'asd',
      weight: 1.0,
      dimension: '10x20x30',
      expirationDate: DateTime.now(),
      location: 'Aisle 4',
      status: true,
      quantity: 10,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await insertProduct(db, newProduct);

    final List<Map<String, dynamic>> products = await db.query('products');
    expect(products.length, isNonZero);
    expect(products.any((p) => p['name'] == newProduct.name), isTrue);

    await db.close();
  });
}
