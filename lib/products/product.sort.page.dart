import 'package:clean_stock/components/selectable_listtile.dart';
import 'package:flutter/material.dart';

class ProductSortPage extends StatelessWidget {
  const ProductSortPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: const Text('Categories'),
          children: [
            SelectableListTile(
              title: 'Category 1',
              icon: Icons.category,
              onTap: (bool isTapped) {},
            ),
            SelectableListTile(
              title: 'Category 2',
              icon: Icons.category,
              onTap: (bool isTapped) {},
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Manufacturers'),
          children: [
            SelectableListTile(
              title: 'Manufacturer 1',
              icon: Icons.business,
              onTap: (bool isTapped) {},
            ),
            SelectableListTile(
              title: 'Manufacturer 2',
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
            SelectableListTile(
              title: 'Supplier 2',
              icon: Icons.supervisor_account,
              onTap: (bool isTapped) {},
            ),
          ],
        )
      ],
    );
  }
}
