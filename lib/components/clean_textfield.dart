import 'package:flutter/material.dart';

class CleanTextField extends StatelessWidget {
  const CleanTextField({
    super.key,
    this.controller,
    this.selectedColor,
    this.labelText,
    this.hintText,
    this.prefix,
    this.suffix,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Color? selectedColor;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    Color effectiveColor =
        selectedColor ?? Theme.of(context).colorScheme.primary;

    return TextField(
      controller: controller,
      cursorColor: effectiveColor.withOpacity(0.6),
      cursorErrorColor: effectiveColor.withOpacity(0.6),
      cursorWidth: 2,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        fillColor: effectiveColor.withOpacity(0.1),
        iconColor: effectiveColor.withOpacity(0.6),
        focusColor: effectiveColor.withOpacity(0.6),
        hoverColor: effectiveColor.withOpacity(0.6),
        labelStyle: TextStyle(color: effectiveColor),
        prefix: prefix,
        suffix: suffix,
        hintStyle: TextStyle(color: effectiveColor.withOpacity(0.6)),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: effectiveColor.withOpacity(0.6)),
          gapPadding: 8,
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: effectiveColor.withOpacity(0.6)),
          gapPadding: 8,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide:
              BorderSide(color: effectiveColor.withOpacity(0.8), width: 2),
          gapPadding: 10,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
