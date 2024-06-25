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

    for (var segment in pathSegments) {
      cumulativePath += '/$segment';
      breadcrumbWidgets.add(InkWell(
        onTap: () {
          context.go(cumulativePath);
        },
        child: Text(segment, style: const TextStyle(color: Colors.blue)),
      ));
      breadcrumbWidgets.add(const Text(' > '));
    }

    if (breadcrumbWidgets.isNotEmpty) {
      breadcrumbWidgets.removeLast();
    }

    return Row(children: breadcrumbWidgets);
  }
}
