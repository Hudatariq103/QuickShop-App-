import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class AddProductScreen extends StatefulWidget {
  final ValueChanged<Product> onProductAdded;

  const AddProductScreen({super.key, required this.onProductAdded});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void submitProduct() {
    if (!formKey.currentState!.validate()) return;
    final product = Product(
      name: nameController.text.trim(),
      price: double.parse(priceController.text.trim()),
      description: descriptionController.text.trim(),
      icon: Icons.shopping_bag_rounded,
    );
    widget.onProductAdded(product);
    nameController.clear();
    priceController.clear();
    descriptionController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product added to the home screen!'), behavior: SnackBarBehavior.floating),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Product')),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(color: paleBlue, borderRadius: BorderRadius.circular(18)),
              child: const Row(
                children: [
                  Icon(Icons.add_shopping_cart_rounded, color: navy, size: 34),
                  SizedBox(width: 13),
                  Expanded(child: Text('Add something new to the QuickShop collection.', style: TextStyle(color: navy, fontWeight: FontWeight.w600))),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold, color: navy)),
            const SizedBox(height: 8),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'e.g. Bluetooth Speaker', prefixIcon: Icon(Icons.label_outline)),
              validator: (value) => value == null || value.trim().isEmpty ? 'Please enter a product name' : null,
            ),
            const SizedBox(height: 18),
            const Text('Product Price (Rs.)', style: TextStyle(fontWeight: FontWeight.bold, color: navy)),
            const SizedBox(height: 8),
            TextFormField(
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(hintText: 'e.g. 2500', prefixIcon: Icon(Icons.currency_exchange)),
              validator: (value) {
                final price = double.tryParse(value?.trim() ?? '');
                if (price == null || price <= 0) return 'Enter a valid price greater than zero';
                return null;
              },
            ),
            const SizedBox(height: 18),
            const Text('Product Description', style: TextStyle(fontWeight: FontWeight.bold, color: navy)),
            const SizedBox(height: 8),
            TextFormField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(hintText: 'Write a short product description...', alignLabelWithHint: true),
              validator: (value) => value == null || value.trim().isEmpty ? 'Please enter a description' : null,
            ),
            const SizedBox(height: 28),
            FilledButton.icon(
              onPressed: submitProduct,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Add Product'),
              style: FilledButton.styleFrom(backgroundColor: blue, padding: const EdgeInsets.symmetric(vertical: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
