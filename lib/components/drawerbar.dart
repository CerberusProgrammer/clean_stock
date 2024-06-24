import 'package:clean_stock/components/drawerbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const routes = [
  {"Home": Icons.home},
  {"Products": Icons.shopping_bag},
  {"Categories": Icons.category},
  {"Orders": Icons.shopping_cart},
  {"Users": Icons.person},
  {"Settings": Icons.settings},
];

class Drawerbar extends ConsumerWidget {
  const Drawerbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 200,
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: ListView(
          children: [
            ...routes.asMap().entries.map((e) {
              final index = e.key;
              final route = e.value.keys.first;
              final icon = e.value.values.first;

              return Drawerbutton(
                  title: route,
                  icon: icon,
                  isSelected: index == 0,
                  onTap: () {});
            })
          ],
        ),
      ),
    );
  }
}
