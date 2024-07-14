import 'package:clean_stock/components/breadcrumbs.dart';
import 'package:clean_stock/components/drawerbar.dart';
import 'package:clean_stock/utils/format_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout(
      {super.key, required this.children, this.floatingButton, this.appBar});

  final Widget children;
  final Widget? floatingButton;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context).routerDelegate.currentConfiguration;
    final fullPathRoute = route.fullPath;
    final String? parameterRoute = route.pathParameters['id'];

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
                    appBar: appBar ??
                        PreferredSize(
                          preferredSize: const Size(double.infinity, 56),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Breadcrumbs(
                                currentPath: parameterRoute != null
                                    ? '${fullPathRoute.substring(0, fullPathRoute.length - 3)}$parameterRoute'
                                    : fullPathRoute),
                          ),
                        ),
                    body: ListView(children: [children]),
                  ),
                ),
              ],
            ),
            floatingActionButton: floatingButton,
          );
        } else {
          return Scaffold(
            appBar: appBar ??
                AppBar(
                  title: Text(formatPath(parameterRoute != null
                      ? '${fullPathRoute.substring(0, fullPathRoute.length - 3)}$parameterRoute'
                      : fullPathRoute)),
                ),
            drawer: const Drawerbar(),
            body: ListView(children: [children]),
            floatingActionButton: floatingButton,
          );
        }
      },
    );
  }
}
