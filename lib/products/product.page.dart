import 'package:clean_stock/components/custom_textbutton.dart';
import 'package:clean_stock/products/product.sort.page.dart';
import 'package:clean_stock/utils/showfade_dialog.dart';
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
                    Expanded(
                      child: CustomTextButton(
                        title: 'Order by',
                        icon: Icons.arrow_downward,
                        onTap: () => showFadeDialog(
                          title: 'Order by',
                          context: context,
                          child: const Text('asd'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomTextButton(
                        title: 'Sort by',
                        icon: Icons.sort,
                        onTap: () => showFadeDialog(
                          title: 'Sort by',
                          context: context,
                          child: const ProductSortPage(),
                        ),
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
