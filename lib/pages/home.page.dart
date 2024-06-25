import 'package:clean_stock/layouts/home.layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(context, ref) {
    return const HomeLayout(
      children: Center(
        child: Text('Home'),
      ),
    );
  }
}
