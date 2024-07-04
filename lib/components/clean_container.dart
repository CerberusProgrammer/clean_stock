import 'package:flutter/material.dart';

class CleanContainer extends StatelessWidget {
  const CleanContainer({
    super.key,
    this.selectedColor,
    this.child,
    this.padding = const EdgeInsets.all(16),
  });

  final Color? selectedColor;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selectedColor?.withOpacity(0.1) ??
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
      ),
      padding: padding,
      child: child,
    );
  }
}
