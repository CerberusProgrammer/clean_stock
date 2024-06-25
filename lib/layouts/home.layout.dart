import 'package:clean_stock/components/breadcrumbs.dart';
import 'package:clean_stock/components/drawerbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, required this.children});

  final Widget children;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;

        if (isLandscape) {
          return Scaffold(
            body: Row(
              children: [
                const Drawerbar(),
                Expanded(
                  flex: 5,
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text('Home'),
                      automaticallyImplyLeading: false,
                    ),
                    body: Column(
                      children: [
                        Breadcrumbs(
                            currentPath: GoRouter.of(context)
                                .routerDelegate
                                .currentConfiguration
                                .fullPath),
                        children,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: const Text('Home')),
            drawer: const Drawerbar(),
            body: children,
          );
        }
      },
    );
  }
}
