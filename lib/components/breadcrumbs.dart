import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Breadcrumbs extends StatelessWidget {
  final String currentPath;

  const Breadcrumbs({super.key, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    List<String> pathSegments =
        currentPath.split('/').where((segment) => segment.isNotEmpty).toList();

    List<Widget> breadcrumbWidgets = [];
    String cumulativePath = '';

    for (int i = 0; i < pathSegments.length; i++) {
      String segment = pathSegments[i];
      if (i < pathSegments.length - 1) {
        cumulativePath += '/$segment';
        breadcrumbWidgets.add(
          TextButton(
            onPressed: () => context.go(cumulativePath),
            child: Text(segment[0].toUpperCase() + segment.substring(1)),
          ),
        );
      } else {
        breadcrumbWidgets.add(
          TextButton(
            onPressed: null,
            child: Text(segment[0].toUpperCase() + segment.substring(1)),
          ),
        );
      }

      if (i < pathSegments.length - 1) {
        breadcrumbWidgets.add(const Text(' > '));
      }
    }

    return Row(children: breadcrumbWidgets);
  }
}
