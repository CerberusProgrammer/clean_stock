import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initializeDB() async {
  String path = await getDatabasesPath();
  String dbPath = join(path, 'database.db');

  return openDatabase(
    dbPath,
    onCreate: (database, version) async {
      await database.execute("""
        CREATE TABLE IF NOT EXISTS categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            parent_id INTEGER,
            name TEXT NOT NULL,
            icon TEXT,
            description TEXT,
            status INTEGER NOT NULL,
            color TEXT,
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL,
            FOREIGN KEY (parent_id) REFERENCES categories (id)
        );
      """);

      await database.execute("""
      CREATE TABLE IF NOT EXISTS suppliers (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          icon TEXT,
          description TEXT,
          address TEXT,
          website TEXT,
          contact_email TEXT,
          contact_phone TEXT,
          country TEXT,
          city TEXT,
          status INTEGER NOT NULL,
          color TEXT,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL
          );
    """);

      await database.execute(
        """
        CREATE TABLE manufacturers(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(255) NOT NULL,
            icon VARCHAR(255),
            description TEXT,
            address TEXT,
            website VARCHAR(255),
            contact_email VARCHAR(255),
            contact_phone VARCHAR(255),
            country VARCHAR(255),
            city VARCHAR(255),
            status INTEGER NOT NULL,
            color VARCHAR(255),
            created_at TEXT NOT NULL,
            updated_at TEXT NOT NULL
        )
        """,
      );

      await database.execute(
        """
      CREATE TABLE products(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR(255) NOT NULL,
          description TEXT,
          barcode VARCHAR(255) NOT NULL,
          weight REAL,
          dimension VARCHAR(255),
          expiration_date TEXT,
          location VARCHAR(255),
          manufacturer_id INTEGER,
          supplier_id INTEGER,
          icon VARCHAR(255),
          image VARCHAR(255),
          status INTEGER NOT NULL,
          price REAL NOT NULL,
          quantity INTEGER NOT NULL,
          quantity_min INTEGER,
          quantity_max INTEGER,
          color VARCHAR(255),
          category_id INTEGER,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL,
          FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(id) ON DELETE SET NULL
          FOREIGN KEY(supplier_id) REFERENCES suppliers(id) ON DELETE SET NULL
          FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE SET NULL
      )
  """,
      );
    },
    version: 1,
  );
}
