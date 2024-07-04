import 'dart:math';

import 'package:clean_stock/models/ccategory.dart';
import 'package:clean_stock/models/manufacturer.dart';
import 'package:clean_stock/models/supplier.dart';
import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/utils/random_string.dart';
import 'package:uuid/uuid.dart';

Product generateRandomProduct() {
  return Product(
    id: const Uuid().v4().toString(),
    name: getRandomString(10),
    price: Random().nextDouble() * 100,
    description: getRandomString(20),
    barcode: getRandomString(6),
    status: Random().nextBool(),
    quantity: Random().nextInt(100),
    createdAt: DateTime.now().subtract(Duration(days: Random().nextInt(365))),
    updatedAt: DateTime.now().subtract(Duration(days: Random().nextInt(365))),
    category: Category(
      id: Random().nextInt(1000000),
      name: getRandomString(10),
      status: Random().nextBool(),
      createdAt: DateTime.now().subtract(
        Duration(
          days: Random().nextInt(365),
        ),
      ),
      updatedAt: DateTime.now().subtract(
        Duration(
          days: Random().nextInt(365),
        ),
      ),
    ),
    supplier: Supplier(
      id: const Uuid().v4().toString(),
      name: getRandomString(10),
      status: Random().nextBool(),
      createdAt: DateTime.now().subtract(
        Duration(
          days: Random().nextInt(365),
        ),
      ),
      updatedAt: DateTime.now().subtract(
        Duration(
          days: Random().nextInt(365),
        ),
      ),
    ),
    manufacturer: Manufacturer(
      id: Random().nextInt(1000000),
      name: getRandomString(10),
      status: Random().nextBool(),
      createdAt: DateTime.now().subtract(
        Duration(
          days: Random().nextInt(365),
        ),
      ),
      updatedAt: DateTime.now().subtract(
        Duration(
          days: Random().nextInt(365),
        ),
      ),
    ),
  );
}
