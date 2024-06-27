import 'package:clean_stock/components/custom_textbutton.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:clean_stock/products/product.sort.page.dart';
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
    final products = ref.watch(testProductsProvider);

    return HomeLayout(
        floatingButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        children: products.when(
            data: (data) {
              return GestureDetector(
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
                                      data.map((d) => d.category).toList(),
                                  manufacturers:
                                      data.map((d) => d.manufacturer).toList(),
                                  suppliers:
                                      data.map((d) => d.supplier).toList(),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      ...data.map(
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
              );
            },
            error: (error, track) => Center(child: Text(error.toString())),
            loading: () => const CircularProgressIndicator()));
  }
}
