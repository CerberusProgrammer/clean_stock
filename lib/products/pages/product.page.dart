import 'package:clean_stock/components/custom_floatingbutton.dart';
import 'package:clean_stock/components/custom_textbutton.dart';
import 'package:clean_stock/products/pages/product.sort.page.dart';
import 'package:clean_stock/products/product.riverpod.dart';
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
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.watch(productsInitializationProvider);

    final products = ref.watch(productsNotifierProvider);
    final productsAsyncValue = ref.watch(productsInitializationProvider);

    return HomeLayout(
      floatingButton: CustomFloatingButton(
        onPressed: () => context.go('/products/create'),
        icon: Icons.add,
      ),
      children: productsAsyncValue.when(
        data: (_) => Center(
            child: products.isEmpty
                ? const Text('No hay productos disponibles.')
                : Column(children: [
                    TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search product by name or barcode',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) =>
                          ref.read(searchQueryProvider.notifier).state = value,
                    ),
                    CustomTextButton(
                      icon: Icons.sort,
                      title: 'Sort by',
                      onTap: () => showFadeDialog(
                        context: context,
                        title: 'Sort products by',
                        child: ProductSortPage(
                          categories: products
                              .map((product) => product.category)
                              .toList(),
                          manufacturers: products
                              .map((product) => product.manufacturer)
                              .toList(),
                          suppliers: products
                              .map((product) => product.supplier)
                              .toList(),
                        ),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final filteredProducts =
                            ref.watch(filteredProductsProvider);

                        return Column(
                          children: [
                            ...filteredProducts.map(
                              (product) => ListTile(
                                title: Text(product.name),
                                subtitle: Text(
                                    product.description ?? 'Sin descripción'),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => ref.read(
                                    deleteProductProvider(product.id).future,
                                  ),
                                ),
                                onTap: () => context.go(
                                  '/products/${product.id}',
                                  extra: {
                                    'product': product,
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ])),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
