import 'package:clean_stock/components/selectable_listtile.dart';
import 'package:clean_stock/models/ccategory.dart';
import 'package:clean_stock/models/manufacturer.dart';
import 'package:clean_stock/models/supplier.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSortPage extends ConsumerWidget {
  const ProductSortPage({
    super.key,
    required this.categories,
    required this.manufacturers,
    required this.suppliers,
  });

  final List<Category?> categories;
  final List<Manufacturer?> manufacturers;
  final List<Supplier?> suppliers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategories = ref.watch(selectedCategoriesProvider);
    final selectedManufacturers = ref.watch(selectedManufacturersProvider);
    final selectedSuppliers = ref.watch(selectedSuppliersProvider);

    print(selectedCategories);

    return Scaffold(
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('Categories'),
            children: categories.map((category) {
              final isSelected = selectedCategories.contains(category);

              return SelectableListTile(
                title: category?.name ?? 'none',
                icon: Icons.category,
                selected: isSelected,
                onTap: (value) {
                  if (isSelected) {
                    ref.read(selectedCategoriesProvider.notifier).state =
                        selectedCategories.where((c) => c != category).toList();
                  } else {
                    ref.read(selectedCategoriesProvider.notifier).state = [
                      ...selectedCategories,
                      category!,
                    ];
                  }
                },
              );
            }).toList(),
          ),
          ExpansionTile(
            title: const Text('Manufacturers'),
            children: manufacturers.map((manufacturer) {
              final isSelected = selectedManufacturers.contains(manufacturer);
              return SelectableListTile(
                title: manufacturer?.name ?? 'none',
                icon: Icons.business,
                selected: isSelected,
                onTap: (value) {
                  if (isSelected) {
                    ref.read(selectedManufacturersProvider.notifier).state =
                        selectedManufacturers
                            .where((m) => m != manufacturer)
                            .toList();
                  } else {
                    ref.read(selectedManufacturersProvider.notifier).state = [
                      ...selectedManufacturers,
                    ];
                  }
                },
              );
            }).toList(),
          ),
          ExpansionTile(
            title: const Text('Suppliers'),
            children: suppliers.map((supplier) {
              final isSelected = selectedSuppliers.contains(supplier);
              return SelectableListTile(
                title: supplier?.name ?? 'none',
                icon: Icons.supervisor_account,
                selected: isSelected,
                onTap: (value) {
                  if (isSelected) {
                    ref.read(selectedSuppliersProvider.notifier).state =
                        selectedSuppliers.where((s) => s != supplier).toList();
                  } else {
                    ref.read(selectedSuppliersProvider.notifier).state = [
                      ...selectedSuppliers,
                    ];
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(selectedCategoriesProvider.notifier).state = [];
              ref.read(selectedManufacturersProvider.notifier).state = [];
              ref.read(selectedSuppliersProvider.notifier).state = [];
            },
            child: const Text('Limpiar Filtros'),
          )
        ],
      ),
    );
  }
}
