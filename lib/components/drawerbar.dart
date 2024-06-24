import 'package:clean_stock/components/drawerbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const appRoutes = [
  {
    "title": "Home",
    "icon": Icons.home,
    "secondaryIcon": Icons.arrow_forward_ios,
    "route": "/",
  },
  {
    "title": "Products",
    "icon": Icons.shopping_bag,
    "secondaryIcon": Icons.arrow_forward_ios,
    "route": "/products",
  },
  {
    "title": "Categories",
    "icon": Icons.category,
    "secondaryIcon": Icons.arrow_forward_ios,
    "route": "/categories",
  },
  {
    "title": "Orders",
    "icon": Icons.shopping_cart,
    "secondaryIcon": Icons.arrow_forward_ios,
    "route": "/orders",
  },
  {
    "title": "Users",
    "icon": Icons.person,
    "secondaryIcon": Icons.arrow_forward_ios,
    "route": "/users",
  },
  {
    "title": "Settings",
    "icon": Icons.settings,
    "secondaryIcon": Icons.arrow_forward_ios,
    "route": "/settings",
  }
];

class Drawerbar extends StatefulWidget {
  const Drawerbar({super.key});

  @override
  State<Drawerbar> createState() => _DrawerbarState();
}

class _DrawerbarState extends State<Drawerbar> {
  final index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: ListView(
          children: appRoutes.asMap().entries.map((entry) {
            final routeInfo = entry.value; // Access the map via value
            return Drawerbutton(
              title: routeInfo['title'] as String,
              icon: routeInfo['icon'] as IconData,
              secondaryIcon: routeInfo['secondaryIcon'] as IconData,
              isSelected: currentRoute == routeInfo['route'],
              onTap: () {},
            );
          }).toList(),
        ),
      ),
    );
  }
}
