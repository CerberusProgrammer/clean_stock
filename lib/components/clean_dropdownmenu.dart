import 'package:flutter/material.dart';

class CleanDropdownMenu<T> extends StatelessWidget {
  const CleanDropdownMenu({
    super.key,
    required this.entries,
    this.hintText,
    this.helperText,
    this.color,
  });

  final List<DropdownMenuEntry<T>> entries;
  final String? hintText;
  final String? helperText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Color effectiveColor = color ?? Theme.of(context).colorScheme.primary;

    return DropdownMenu(
      enableSearch: true,
      hintText: hintText,
      helperText: helperText,
      dropdownMenuEntries: entries,
      initialSelection: entries.first.value,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
          gapPadding: 8,
        ),
      ),
    );
  }
}
