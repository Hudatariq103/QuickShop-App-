import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String description;
  final IconData icon;
  final String? imageAsset;
  final String category;
  bool favourite;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.icon,
    this.imageAsset,
    this.category = 'Accessories',
    this.favourite = false,
  });
}
