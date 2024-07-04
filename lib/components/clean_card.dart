import 'package:flutter/material.dart';

class CleanCard extends StatelessWidget {
  const CleanCard({
    super.key,
    this.child,
    this.size = const Size(140, 100),
    this.color,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget? child;
  final Size size;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    Color effectiveColor = color ?? Theme.of(context).colorScheme.primary;

    return Container(
      height: size.height,
      width: size.width,
      padding: padding,
      decoration: BoxDecoration(
        color: effectiveColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
