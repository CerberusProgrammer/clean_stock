import 'package:clean_stock/components/drawerbutton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const appRoutes = [
  {
    "title": "Home",
    "icon": Icons.home,
    "secondaryIcon": Icons.home_outlined,
    "route": "/",
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: ListView(children: [
          SizedBox(
            height: 64,
            child: Center(
              child: Text(
                'Clean Stock',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          ...appRoutes.asMap().entries.map((entry) {
            final routeInfo = entry.value;
            return Drawerbutton(
              title: routeInfo['title'] as String,
              icon: routeInfo['icon'] as IconData,
              secondaryIcon: routeInfo['secondaryIcon'] as IconData,
              isSelected: GoRouter.of(context)
                      .routerDelegate
                      .currentConfiguration
                      .fullPath ==
                  routeInfo['route'],
              onTap: () {
                context.go(routeInfo['route'] as String);
                setState(() {});
              },
            );
          }),
        ]),
      ),
    );
  }
}
