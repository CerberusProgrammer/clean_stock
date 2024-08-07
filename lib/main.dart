import 'package:clean_stock/core/router/app.router.dart';
import 'package:clean_stock/core/theme/app.theme.dart';
import 'package:clean_stock/categories/models/ccategory.dart';
import 'package:clean_stock/models/manufacturer.dart';
import 'package:clean_stock/models/supplier.dart';
import 'package:clean_stock/products/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
  } else {
    await Hive.initFlutter();
  }

  Hive.registerAdapter(ManufacturerAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(SupplierAdapter());

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Clean Stock',
      theme: ref.watch(themeProvider),
      routerConfig: appRouter,
    );
  }
}
