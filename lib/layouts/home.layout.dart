import 'package:clean_stock/components/drawerbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;

        if (isLandscape) {
          return Scaffold(
            body: Row(
              children: [
                // Contenido principal
                const Drawerbar(),
                Expanded(
                  flex: 5,
                  child: Scaffold(
                    appBar: AppBar(title: const Text('Home')),
                    body: const Center(
                      child: Text('Home'),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: const Text('Home')),
            drawer: Drawer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Home'),
                      onTap: () => context.go('/'),
                    ),
                  ],
                ),
              ),
            ),
            body: const Center(
              child: Text('Home'),
            ),
          );
        }
      },
    );
  }
}
