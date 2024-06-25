import 'package:clean_stock/components/drawerbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const appRoutes = [
  {
    "title": "Home",
    "icon": Icons.home,
    "secondaryIcon": Icons.home_outlined,
    "route": "/",
  },
  {
    "title": "Products",
    "icon": Icons.shopping_bag,
    "secondaryIcon": Icons.shopping_bag_outlined,
    "route": "/products",
  },
  {
    "title": "Categories",
    "icon": Icons.category,
    "secondaryIcon": Icons.category_outlined,
    "route": "/categories",
  },
  {
    "title": "Orders",
    "icon": Icons.shopping_cart,
    "secondaryIcon": Icons.shopping_cart_outlined,
    "route": "/orders",
  },
  {
    "title": "Users",
    "icon": Icons.person,
    "secondaryIcon": Icons.person_outline,
    "route": "/users",
  },
  {
    "title": "Settings",
    "icon": Icons.settings,
    "secondaryIcon": Icons.settings_outlined,
    "route": "/settings",
  }
];

class Drawerbar extends StatefulWidget {
  const Drawerbar({super.key});

  @override
  State<Drawerbar> createState() => _DrawerbarState();
}

class _DrawerbarState extends State<Drawerbar> {
  var route = 'Home';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: ListView(
          children: appRoutes.asMap().entries.map((entry) {
            final routeInfo = entry.value;
            return Drawerbutton(
              title: routeInfo['title'] as String,
              icon: routeInfo['icon'] as IconData,
              secondaryIcon: routeInfo['secondaryIcon'] as IconData,
              isSelected: route == routeInfo['title'],
              onTap: () => setState(() {
                route = routeInfo['title'] as String;
              }),
            );
          }).toList(),
        ),
      ),
    );
  }
}
