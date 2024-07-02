import 'package:flutter/material.dart';

class SelectableListTile extends StatefulWidget {
  const SelectableListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.selected = false,
  });

  final String title;
  final IconData icon;
  final Function(bool isTapped) onTap;
  final bool selected;

  @override
  State<SelectableListTile> createState() => _SelectableListTileState();
}

class _SelectableListTileState extends State<SelectableListTile> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: _isSelected || widget.selected,
      onChanged: (bool? value) {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onTap(_isSelected);
      },
    );
  }
}
