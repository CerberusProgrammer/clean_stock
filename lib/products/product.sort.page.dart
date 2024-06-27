import 'package:clean_stock/components/selectable_listtile.dart';
import 'package:clean_stock/models/category.dart';
import 'package:flutter/material.dart';

class ProductSortPage extends StatelessWidget {
  const ProductSortPage({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    print(categories);

    return ListView(
      children: [
        ExpansionTile(
            title: const Text('Categories'),
            children: categories
                .map(
                  (category) => SelectableListTile(
                    title: category.name,
                    icon: Icons.category,
                    onTap: (bool isTapped) {},
                  ),
                )
                .toList()),
        ExpansionTile(
          title: const Text('Manufacturers'),
          children: [
            SelectableListTile(
              title: 'Manufacturer 1',
              icon: Icons.business,
              onTap: (bool isTapped) {},
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Suppliers'),
          children: [
            SelectableListTile(
              title: 'Supplier 1',
              icon: Icons.supervisor_account,
              onTap: (bool isTapped) {},
            ),
          ],
        )
      ],
    );
  }
}
