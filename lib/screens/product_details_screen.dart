import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final VoidCallback onFavouriteChanged;

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onFavouriteChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 260,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: paleBlue, borderRadius: BorderRadius.circular(24)),
            child: product.imageAsset != null
                ? Image.asset(product.imageAsset!, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Icon(product.icon, size: 110, color: blue))
                : Icon(product.icon, size: 110, color: blue),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(child: Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: navy))),
              IconButton(
                onPressed: () {
                  product.favourite = !product.favourite;
                  onFavouriteChanged();
                },
                icon: Icon(product.favourite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
              ),
            ],
          ),
          Text('Rs. ${product.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: blue)),
          const SizedBox(height: 20),
          const Text('Description', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: navy)),
          const SizedBox(height: 8),
          Text(product.description, style: const TextStyle(fontSize: 15, height: 1.6, color: Colors.blueGrey)),
          const SizedBox(height: 28),
          FilledButton.icon(
            onPressed: onAddToCart,
            icon: const Icon(Icons.shopping_cart_outlined),
            label: const Text('Add to Cart'),
            style: FilledButton.styleFrom(backgroundColor: blue, padding: const EdgeInsets.symmetric(vertical: 15)),
          ),
        ],
      ),
    );
  }
}
