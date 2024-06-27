import 'package:clean_stock/pages/home.page.dart';
import 'package:clean_stock/pages/profile.page.dart';
import 'package:clean_stock/pages/settings.page.dart';
import 'package:clean_stock/products/product.page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomePage())),
    GoRoute(
        path: '/products',
        name: 'products',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ProductPage())),
    GoRoute(
        path: '/settings',
        name: 'settings',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SettingsPage()),
        routes: [
          GoRoute(
              path: 'profile',
              name: 'profile',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfilePage()))
        ])
  ],
);

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
    "title": "Settings",
    "icon": Icons.settings,
    "secondaryIcon": Icons.settings_outlined,
    "route": "/settings",
  }
];
