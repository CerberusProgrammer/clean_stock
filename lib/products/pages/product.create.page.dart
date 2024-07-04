import 'package:clean_stock/components/clean_card.dart';
import 'package:clean_stock/components/clean_iconbutton.dart';
import 'package:clean_stock/components/clean_textfield.dart';
import 'package:clean_stock/components/custom_floatingbutton.dart';
import 'package:clean_stock/layouts/home.layout.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:clean_stock/utils/generate_random_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCreatePage extends ConsumerStatefulWidget {
  const ProductCreatePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductCreatePageState();
}

class _ProductCreatePageState extends ConsumerState<ProductCreatePage> {
  Color? selectedColor;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final colorsOptions = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      floatingButton: CustomFloatingButton(
        onPressed: () {
          final newProduct = generateRandomProduct();
          ref.read(createProductProvider(newProduct).future);
          Navigator.of(context).pop();
        },
        icon: Icons.add,
      ),
      children: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CleanIconButton(
                color: selectedColor,
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (builder) => ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Scaffold(
                      appBar: AppBar(
                        title: const Text('Select a color'),
                        automaticallyImplyLeading: false,
                      ),
                      body: GridView.count(
                        padding: const EdgeInsets.all(16),
                        crossAxisCount: 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: [
                          ...colorsOptions.map(
                            (color) => CleanIconButton(
                              color: color,
                              onTap: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CleanCard(
                  color: selectedColor,
                  child: Column(
                    children: [
                      Text(
                        nameController.text.isEmpty
                            ? 'Product name'
                            : nameController.text.length > 7
                                ? '${nameController.text.substring(0, 6)}...'
                                : nameController.text,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 32,
                        child: CleanCard(
                          color: selectedColor,
                          padding: null,
                          child: Center(
                            child: Text(
                              priceController.text.isEmpty
                                  ? 'MXN \$00.00'
                                  : priceController.text.length > 7
                                      ? 'MXN \$${priceController.text.substring(0, 5)}...'
                                      : 'MXN \$${priceController.text}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: selectedColor?.withOpacity(0.1) ??
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CleanTextField(
                  labelText: 'Product name',
                  controller: nameController,
                  selectedColor: selectedColor,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),
                CleanTextField(
                  labelText: 'Price',
                  controller: priceController,
                  selectedColor: selectedColor,
                  type: TextFieldType.onlyFloatCommercial,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
