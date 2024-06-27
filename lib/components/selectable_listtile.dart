import 'package:flutter/material.dart';

class SelectableListTile extends StatefulWidget {
  const SelectableListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final Function(bool isTapped) onTap;

  @override
  State<SelectableListTile> createState() => _SelectableListTileState();
}

class _SelectableListTileState extends State<SelectableListTile> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: _isSelected,
      onChanged: (bool? value) {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onTap(_isSelected);
      },
    );
  }
}
