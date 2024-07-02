import 'package:clean_stock/components/custom_textbutton.dart';
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

    return Scaffold(
        body: ListView(
          children: [
            ExpansionTile(
              title: const Text('Categories'),
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
                          (state) =>
                              state.where((c) => c != category).toList());
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
                final isSelected = selectedManufacturers.contains(manufacturer);
                if (manufacturer == null) {
                  return Container();
                }

                return SelectableListTile(
                  title: manufacturer.name,
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

                if (supplier == null) {
                  return Container();
                }

                return SelectableListTile(
                  title: supplier.name,
                  icon: Icons.supervisor_account,
                  selected: isSelected,
                  onTap: (value) {
                    if (isSelected) {
                      ref.read(selectedSuppliersProvider.notifier).state =
                          selectedSuppliers
                              .where((s) => s != supplier)
                              .toList();
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
        floatingActionButton: CustomTextButton(
          onTap: () {
            ref.read(selectedCategoriesProvider.notifier).state = [];
            ref.read(selectedManufacturersProvider.notifier).state = [];
            ref.read(selectedSuppliersProvider.notifier).state = [];
          },
          title: 'Limpiar Filtros',
        ));
  }
}
