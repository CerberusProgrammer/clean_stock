import 'package:flutter/material.dart';

class CleanIconButton extends StatefulWidget {
  const CleanIconButton({
    super.key,
    this.color,
    this.onTap,
    this.isExpanded = false,
    this.size = const Size(40, 40),
    required this.icon,
  });

  final IconData icon;
  final Color? color;
  final Function()? onTap;
  final bool? isExpanded;
  final Size? size;

  @override
  State<CleanIconButton> createState() => _CleanIconButtonState();
}

class _CleanIconButtonState extends State<CleanIconButton> {
  @override
  Widget build(BuildContext context) {
    Color effectiveColor =
        widget.color ?? Theme.of(context).colorScheme.primary;

    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: effectiveColor.withOpacity(0.1),
      focusColor: effectiveColor.withOpacity(0.1),
      highlightColor: effectiveColor.withOpacity(0.1),
      hoverColor: effectiveColor.withOpacity(0.1),
      child: Container(
        height: widget.size!.height,
        width: widget.size!.width,
        decoration: BoxDecoration(
          color: effectiveColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          widget.icon,
          color: effectiveColor.withOpacity(0.6),
        ),
      ),
    );
  }
}
