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

    return Scaffold(
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('Categories'),
            initiallyExpanded: selectedCategories.isNotEmpty,
            children: categories.map((category) {
              if (category == null) {
                return Container();
              }

              final isSelected = selectedCategories.contains(category);

              return SelectableListTile(
                title: category.name,
                icon: Icons.category,
                selected: isSelected,
                onTap: (value) {
                  if (isSelected) {
                    ref.read(selectedCategoriesProvider.notifier).update(
                        (state) => state.where((c) => c != category).toList());
                  } else {
                    ref
                        .read(selectedCategoriesProvider.notifier)
                        .update((state) => [...state, category]);
                  }
                },
              );
            }).toList(),
          ),
          ExpansionTile(
            title: const Text('Manufacturers'),
            children: manufacturers.map((manufacturer) {
              if (manufacturer == null) {
                return Container();
              }

              final isSelected = ref
                  .watch(selectedManufacturersProvider)
                  .contains(manufacturer);

              return SelectableListTile(
                title: manufacturer.name,
                icon: Icons.business,
                selected: isSelected,
                onTap: (value) {
                  if (isSelected) {
                    ref.read(selectedManufacturersProvider.notifier).update(
                        (state) =>
                            state.where((m) => m != manufacturer).toList());
                  } else {
                    ref
                        .read(selectedManufacturersProvider.notifier)
                        .update((state) => [...state, manufacturer]);
                  }
                },
              );
            }).toList(),
          ),
          ExpansionTile(
            title: const Text('Suppliers'),
            children: suppliers.map((supplier) {
              if (supplier == null) {
                return Container();
              }

              final isSelected =
                  ref.watch(selectedSuppliersProvider).contains(supplier);

              return SelectableListTile(
                title: supplier.name,
                icon: Icons.supervisor_account,
                selected: isSelected,
                onTap: (value) {
                  if (isSelected) {
                    ref.read(selectedSuppliersProvider.notifier).update(
                        (state) => state.where((s) => s != supplier).toList());
                  } else {
                    ref
                        .read(selectedSuppliersProvider.notifier)
                        .update((state) => [...state, supplier]);
                  }
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
