import 'package:clean_stock/models/ccategory.dart';
import 'package:clean_stock/models/manufacturer.dart';
import 'package:clean_stock/models/supplier.dart';
import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/product.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) {
  return '';
});

final selectedCategoriesProvider = StateProvider<List<Category>>((ref) => []);
final selectedManufacturersProvider =
    StateProvider<List<Manufacturer>>((ref) => []);
final selectedSuppliersProvider = StateProvider<List<Supplier>>((ref) => []);

final filteredProductsProvider = Provider<List<Product>>((ref) {
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();
  final selectedCategoryNames = ref
      .watch(selectedCategoriesProvider)
      .map((category) => category.name.toLowerCase())
      .toList();
  final selectedManufacturerNames = ref
      .watch(selectedManufacturersProvider)
      .map((manufacturer) => manufacturer.name.toLowerCase())
      .toList();
  final selectedSupplierNames = ref
      .watch(selectedSuppliersProvider)
      .map((supplier) => supplier.name.toLowerCase())
      .toList();
  final products = ref.watch(productsNotifierProvider);

  return products.where((product) {
    final matchesSearchQuery =
        product.name.toLowerCase().contains(searchQuery) ||
            product.barcode.toLowerCase().contains(searchQuery);
    final isInSelectedCategories = selectedCategoryNames.isEmpty ||
        selectedCategoryNames.contains(product.category?.name.toLowerCase());
    final isInSelectedManufacturers = selectedManufacturerNames.isEmpty ||
        selectedManufacturerNames
            .contains(product.manufacturer?.name.toLowerCase());
    final isInSelectedSuppliers = selectedSupplierNames.isEmpty ||
        selectedSupplierNames.contains(product.supplier?.name.toLowerCase());

    return matchesSearchQuery &&
        isInSelectedCategories &&
        isInSelectedManufacturers &&
        isInSelectedSuppliers;
  }).toList();
});

final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  return ProductsNotifier();
});

final productsInitializationProvider = FutureProvider<void>((ref) async {
  await ref.read(productsNotifierProvider.notifier).initializeProducts();
});

final productByIdProvider = Provider.family<Product?, String>((ref, productId) {
  final products = ref.watch(productsNotifierProvider);
  final intId = int.tryParse(productId);
  return products.firstWhere(
    (product) => product.id == intId,
  );
});

final createProductProvider =
    FutureProvider.autoDispose.family<Product, Product>((ref, product) async {
  final createdProduct =
      await ProductService.createProduct(product: product, token: '');

  ref.read(productsNotifierProvider.notifier).add(createdProduct);

  return createdProduct;
});

final deleteProductProvider =
    FutureProvider.autoDispose.family<void, int>((ref, productId) async {
  await ProductService.deleteProduct(id: productId.toString(), token: '');
  ref.read(productsNotifierProvider.notifier).remove(productId);
});

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super([]);

  Future<void> initializeProducts() async {
    final products = await ProductService.getProducts(token: '');
    state = products;
  }

  void add(Product product) {
    state = [...state, product];
  }

  void remove(int id) {
    state = state.where((product) => product.id != id).toList();
  }

  void update(Product product) {}
}
