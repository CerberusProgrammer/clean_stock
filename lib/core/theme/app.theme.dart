import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart'; // Importa google_fonts

final colorProvider = StateProvider<Color>((ref) {
  return Colors.indigo;
});

final themeProvider = Provider<ThemeData>(
  (ref) => ThemeData(
    colorSchemeSeed: ref.watch(colorProvider),
    brightness: Brightness.light,
    textTheme: GoogleFonts.manropeTextTheme(
      ThemeData(brightness: Brightness.light).textTheme,
    ),
  ),
);
