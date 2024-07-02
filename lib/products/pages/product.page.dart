import 'package:clean_stock/components/custom_textbutton.dart';
import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:clean_stock/products/pages/product.sort.page.dart';
import 'package:clean_stock/utils/showfade_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_stock/layouts/home.layout.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsState);

    return HomeLayout(
        floatingButton: FloatingActionButton(
          elevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          disabledElevation: 0,
          enableFeedback: true,
          highlightElevation: 0,
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => ListView(
              children: [
                FilledButton(
                    onPressed: () {
                      ref.watch(productsState.notifier).state.add(Product(
                            name: 'Product',
                            barcode: 'Barcode',
                            price: 5,
                            id: 0,
                            status: false,
                            quantity: 10,
                            updatedAt: DateTime.now(),
                            createdAt: DateTime.now(),
                          ));
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text('Crear'))
              ],
            ),
          ),
          child: const Icon(Icons.add),
        ),
        children: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  focusNode: FocusNode(),
                  decoration: InputDecoration(
                    hintText: 'Product or barcode',
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {
                        _controller.clear();
                      },
                      icon: const Icon(
                        Icons.close,
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
                          child: ProductSortPage(
                            categories:
                                products.map((d) => d.category).toList(),
                            manufacturers:
                                products.map((d) => d.manufacturer).toList(),
                            suppliers: products.map((d) => d.supplier).toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                ...products.map(
                  (e) => ListTile(
                    title: Text(e.name),
                    leading: CircleAvatar(child: Text(e.name[0])),
                    subtitle: Text(e.barcode),
                    trailing: Text(e.price.toString()),
                    onTap: () => context.go('/products/${e.id}'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
