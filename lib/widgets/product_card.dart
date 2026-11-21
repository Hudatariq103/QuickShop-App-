import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final VoidCallback onFavourite;
  final VoidCallback onLongPress;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onFavourite,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        onDoubleTap: onFavourite,
        onLongPress: onLongPress,
        child: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0xFFE8DFDA)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: SizedBox(
                  width: 116,
                  height: 124,
                  child: product.imageAsset != null
                      ? Image.asset(
                          product.imageAsset!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: paleBlue,
                            child: Icon(product.icon, size: 40, color: terracotta),
                          ),
                        )
                      : Container(color: paleBlue, child: Icon(product.icon, size: 40, color: terracotta)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category.toUpperCase(),
                      style: const TextStyle(fontSize: 9, letterSpacing: 1.2, color: terracotta, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15, height: 1.15, fontWeight: FontWeight.w800, color: navy),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10.5, height: 1.25, color: Color(0xFF756970)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Rs. ${product.price.toStringAsFixed(0)}',
                            style: const TextStyle(color: navy, fontWeight: FontWeight.w800, fontSize: 14),
                          ),
                        ),
                        Icon(
                          product.favourite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          size: 19,
                          color: product.favourite ? terracotta : const Color(0xFF887A80),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text('TAP TO VIEW DETAILS  →', style: TextStyle(fontSize: 8, letterSpacing: .7, color: Color(0xFF8A747D), fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
