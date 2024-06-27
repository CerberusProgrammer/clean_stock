import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_stock/layouts/home.layout.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
        floatingButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        children: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Product or barcode',
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter,
                        size: 18,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                Row(
                  children: [
                    DropdownMenu(
                      label: const Text('Category'),
                      enableSearch: true,
                      requestFocusOnTap: true,
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(
                            value: 'electronico', label: 'electronico'),
                        DropdownMenuEntry(value: 'ropa', label: 'ropa'),
                        DropdownMenuEntry(value: 'comida', label: 'comida'),
                      ],
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide.none),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                ...List.generate(
                  12,
                  (index) => ListTile(
                    leading: CircleAvatar(child: Text('$index')),
                    title: Text('Product $index'),
                    trailing: Text('\$$index.00'),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
