import 'package:clean_stock/components/selectable_listtile.dart';
import 'package:clean_stock/models/ccategory.dart';
import 'package:clean_stock/models/manufacturer.dart';
import 'package:clean_stock/models/supplier.dart';
import 'package:flutter/material.dart';

class ProductSortPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: const Text('Categories'),
          children: categories
              .map(
                (category) => category != null
                    ? SelectableListTile(
                        title: category.name,
                        icon: Icons.category,
                        onTap: (bool isTapped) {},
                      )
                    : const SizedBox(),
              )
              .toList(),
        ),
        ExpansionTile(
            title: const Text('Manufacturers'),
            children: manufacturers
                .map(
                  (manufacturer) => manufacturer != null
                      ? SelectableListTile(
                          title: manufacturer.name,
                          icon: Icons.business,
                          onTap: (bool isTapped) {},
                        )
                      : const SizedBox(),
                )
                .toList()),
        ExpansionTile(
            title: const Text('Suppliers'),
            children: suppliers
                .map(
                  (supplier) => supplier != null
                      ? SelectableListTile(
                          title: supplier.name,
                          icon: Icons.supervisor_account,
                          onTap: (bool isTapped) {},
                        )
                      : const SizedBox(),
                )
                .toList())
      ],
    );
  }
}
