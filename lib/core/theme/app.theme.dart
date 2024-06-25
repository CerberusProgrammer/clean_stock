import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart'; // Importa google_fonts

final colorProvider = StateProvider<Color>((ref) {
  return Colors.indigo;
});

final brighnessProvider = StateProvider<Brightness>((ref) {
  return Brightness.light;
});

final themeProvider = Provider<ThemeData>(
  (ref) => ThemeData(
    colorSchemeSeed: ref.watch(colorProvider),
    brightness: ref.watch(brighnessProvider),
    textTheme: GoogleFonts.manropeTextTheme(
      ThemeData(brightness: ref.watch(brighnessProvider)).textTheme,
    ),
  ),
);
