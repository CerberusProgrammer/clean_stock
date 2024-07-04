import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFieldType {
  onlyText,
  onlyNumbers,
  alphaCode,
  onlyFloat,
  onlyFloatCommercial
}

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
    this.type,
    this.isRequired = false,
  });

  final bool? isRequired;
  final TextFieldType? type;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Color? selectedColor;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> inputFormatters = [];
    TextInputType keyboardType = TextInputType.text;

    if (type != null) {
      switch (type!) {
        case TextFieldType.onlyText:
          inputFormatters
              .add(FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')));
          keyboardType = TextInputType.text;
          break;
        case TextFieldType.onlyNumbers:
          inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
          keyboardType = TextInputType.number;
          break;
        case TextFieldType.alphaCode:
          inputFormatters
              .add(FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')));
          keyboardType = TextInputType.text;
          break;
        case TextFieldType.onlyFloat:
          inputFormatters
              .add(FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')));
          keyboardType = const TextInputType.numberWithOptions(decimal: true);
          break;
        case TextFieldType.onlyFloatCommercial:
          inputFormatters.add(
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')));
          keyboardType = const TextInputType.numberWithOptions(decimal: true);
          break;
      }
    }

    Color effectiveColor =
        selectedColor ?? Theme.of(context).colorScheme.primary;

    return TextFormField(
      controller: controller,
      cursorColor: effectiveColor.withOpacity(0.6),
      cursorErrorColor: effectiveColor.withOpacity(0.6),
      cursorWidth: 2,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      validator: (value) {
        if (isRequired != null ? isRequired! : false) {
          if (value == null || value.isEmpty) {
            return 'This field is required.';
          }
        }
        return null;
      },
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
