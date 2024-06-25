import 'package:clean_stock/layouts/home.layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeLayout(
      children: Center(
        child: Text('Home'),
      ),
    );
  }
}
