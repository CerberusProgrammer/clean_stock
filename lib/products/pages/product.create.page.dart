import 'package:clean_stock/components/clean_card.dart';
import 'package:clean_stock/components/clean_container.dart';
import 'package:clean_stock/components/clean_dropdownmenu.dart';
import 'package:clean_stock/components/clean_iconbutton.dart';
import 'package:clean_stock/components/clean_textfield.dart';
import 'package:clean_stock/components/custom_floatingbutton.dart';
import 'package:clean_stock/layouts/home.layout.dart';
import 'package:clean_stock/products/models/product.dart';
import 'package:clean_stock/products/product.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class ProductCreatePage extends ConsumerStatefulWidget {
  const ProductCreatePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductCreatePageState();
}

class _ProductCreatePageState extends ConsumerState<ProductCreatePage> {
  Color? selectedColor;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();

  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

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
            if (formKey.currentState!.validate()) {
              ref.read(
                createProductProvider(
                  Product(
                    id: const Uuid().v4().toString(),
                    name: nameController.text,
                    barcode: 'barcode',
                    status: true,
                    price: double.parse(priceController.text),
                    quantity: 0,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                    color: selectedColor != null
                        ? selectedColor!.value.toRadixString(16).substring(2)
                        : Theme.of(context)
                            .colorScheme
                            .primary
                            .value
                            .toRadixString(16)
                            .substring(2),
                  ),
                ).future,
              );
              Navigator.of(context).pop();
            }
          },
          icon: Icons.add,
        ),
        children: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CleanIconButton(
                    icon: Icons.palette,
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
                                  icon: Icons.palette,
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
                  const SizedBox(width: 16),
                  CleanIconButton(
                    icon: Icons.delete,
                    color: selectedColor,
                    onTap: () {
                      nameController.clear();
                      priceController.clear();
                      setState(() {
                        selectedColor = null;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(width: 16),
              CleanContainer(
                selectedColor: selectedColor,
                child: Column(
                  children: [
                    CleanTextField(
                      isRequired: true,
                      labelText: 'Product name',
                      controller: nameController,
                      selectedColor: selectedColor,
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CleanTextField(
                            isRequired: true,
                            labelText: 'Price',
                            controller: priceController,
                            selectedColor: selectedColor,
                            type: TextFieldType.onlyFloatCommercial,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        const CleanDropdownMenu(
                          entries: [
                            DropdownMenuEntry(value: 'MXN', label: 'MXN'),
                            DropdownMenuEntry(value: 'USD', label: 'USD'),
                            DropdownMenuEntry(value: 'EUR', label: 'EUR'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              CleanContainer(
                selectedColor: selectedColor,
                padding: const EdgeInsets.all(0),
                child: ExpansionTile(
                  childrenPadding: const EdgeInsets.all(16),
                  title: const Text('Details'),
                  children: [
                    CleanTextField(
                      labelText: 'Description',
                      selectedColor: selectedColor,
                    ),
                    const SizedBox(height: 16),
                    CleanTextField(
                      labelText: 'Barcode',
                      selectedColor: selectedColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90)
            ],
          ),
        ));
  }
}
