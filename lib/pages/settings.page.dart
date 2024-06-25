import 'package:clean_stock/layouts/home.layout.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeLayout(
      children: Center(
        child: Text('Settings'),
      ),
    );
  }
}
