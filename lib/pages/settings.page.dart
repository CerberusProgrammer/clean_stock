import 'package:clean_stock/core/theme/app.theme.dart';
import 'package:clean_stock/layouts/home.layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(context, ref) {
    return HomeLayout(
      children: Column(
        children: [
          FilledButton(
            onPressed: () => context.go('/settings/profile'),
            child: const Text('Perfil'),
          ),
          SwitchListTile(
            title: const Text('Tema oscuro'),
            value: ref.watch(brighnessProvider) != Brightness.light,
            onChanged: (value) {
              ref.read(brighnessProvider.notifier).state =
                  value ? Brightness.dark : Brightness.light;
            },
          )
        ],
      ),
    );
  }
}
