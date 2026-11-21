import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';
import '../widgets/product_card.dart';
import 'add_product_screen.dart';
import 'product_details_screen.dart';
import 'gesture_animation_screen.dart';
import 'web_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> products = [
    Product(name: 'Wireless Headphones', price: 5499, description: 'Comfortable wireless headphones with clear sound and a long-lasting battery.', icon: Icons.headphones_rounded, imageAsset: 'assets/products/headphones.jpg', category: 'Electronics'),
    Product(name: 'Smart Watch', price: 7999, description: 'A stylish smart watch to help you stay connected and track your daily activity.', icon: Icons.watch_rounded, imageAsset: 'assets/products/watch.jpg', category: 'Gadgets'),
    Product(name: 'Running Shoes', price: 6499, description: 'Lightweight everyday running shoes designed for comfort and support.', icon: Icons.directions_run_rounded, imageAsset: 'assets/products/shoes.jpg', category: 'Footwear'),
    Product(name: 'Backpack', price: 3299, description: 'A practical backpack with plenty of room for your everyday essentials.', icon: Icons.backpack_rounded, imageAsset: 'assets/products/backpack.jpg', category: 'Accessories'),
    Product(name: 'Camera', price: 18999, description: 'Capture your favourite moments with this compact digital camera.', icon: Icons.camera_alt_rounded, imageAsset: 'assets/products/camera.jpg', category: 'Electronics'),
    Product(name: 'Coffee Mug', price: 899, description: 'A simple ceramic mug for your coffee, tea, or any favourite drink.', icon: Icons.coffee_rounded, imageAsset: 'assets/products/mug.jpg', category: 'Accessories'),
  ];

  int cartCount = 0;
  String searchQuery = '';
  String selectedCategory = 'All';
  int counter = 0;
  bool expanded = false;
  double horizontalDistance = 0;
  double verticalDistance = 0;

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating));
  }

  void openDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailsScreen(
          product: product,
          onAddToCart: () {
            setState(() => cartCount++);
            showMessage('${product.name} added to cart!');
          },
          onFavouriteChanged: () => setState(() {}),
        ),
      ),
    );
  }

  void openAddProduct() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddProductScreen(
          onProductAdded: (product) {
            setState(() => products.add(product));
            showMessage('${product.name} added successfully.');
          },
        ),
      ),
    );
  }

  void openWebView() {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => const WebViewScreen()));
  }

  void openGestures() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => GestureAnimationScreen(
          onCounterChanged: (value) => setState(() => counter = value),
          initialCounter: counter,
        ),
      ),
    ).then((value) {
      if (value is int) setState(() => counter = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 66,
        titleSpacing: 20,
        title: Row(
          children: const [
            Icon(Icons.shopping_bag_rounded, color: terracotta, size: 25),
            SizedBox(width: 10),
            Text('QuickShop', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: -0.4, color: navy, fontSize: 20)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Add product',
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (_) => AddProductScreen(onProductAdded: (product) {
                setState(() => products.add(product));
                showMessage('${product.name} added successfully.');
              }),
            )),
            icon: const Icon(Icons.add_circle_outline_rounded, color: terracotta, size: 27),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_basket_outlined, size: 25, color: navy),
                if (cartCount > 0)
                  Positioned(
                    right: -8,
                    top: -7,
                    child: CircleAvatar(
                      radius: 9,
                      backgroundColor: terracotta,
                      child: Text('$cartCount', style: const TextStyle(fontSize: 10, color: Colors.white)),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 34),
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('A GOOD DAY TO DISCOVER', style: TextStyle(color: terracotta, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.5)),
                      SizedBox(height: 6),
                      Text('Find your next\nfavourite thing.', style: TextStyle(fontSize: 27, height: 1.12, fontWeight: FontWeight.w800, color: navy)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(color: const Color(0xFFEDE5DF), borderRadius: BorderRadius.circular(18)),
                  child: const Icon(Icons.auto_awesome_rounded, color: terracotta, size: 25),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF351526), Color(0xFF263B63)],
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [BoxShadow(color: Color(0x22351526), blurRadius: 14, offset: Offset(0, 6))],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('THE EVERYDAY EDIT', style: TextStyle(color: Color(0xFFEACBD5), fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1.4)),
                        SizedBox(height: 8),
                        Text('Little upgrades.\nBig difference.', style: TextStyle(color: Colors.white, fontSize: 21, height: 1.13, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Thoughtful picks for work, home and play.', style: TextStyle(color: Color(0xFFE7DDE2), fontSize: 11, height: 1.3)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/products/headphones.jpg',
                      width: 112,
                      height: 124,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 112, height: 124, color: const Color(0xFF263B63),
                        child: const Icon(Icons.headphones_rounded, color: Colors.white, size: 42),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) => setState(() => searchQuery = value.trim().toLowerCase()),
                    decoration: InputDecoration(
                      hintText: 'Search the collection...',
                      hintStyle: const TextStyle(color: Color(0xFF8A7D82), fontSize: 13),
                      prefixIcon: const Icon(Icons.search_rounded, color: terracotta, size: 20),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 13),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFFE7DFDA))),
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                PopupMenuButton<String>(
                  tooltip: 'Filter products',
                  initialValue: selectedCategory,
                  onSelected: (value) => setState(() => selectedCategory = value),
                  itemBuilder: (context) => ['All', 'Electronics', 'Gadgets', 'Footwear', 'Accessories']
                      .map((category) => PopupMenuItem(value: category, child: Text(category == 'All' ? 'All categories' : category)))
                      .toList(),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(color: const Color(0xFFEDE5DF), borderRadius: BorderRadius.circular(14)),
                    child: const Icon(Icons.tune_rounded, color: navy),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CURATED FOR YOU', style: TextStyle(color: terracotta, fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1.5)),
                      SizedBox(height: 4),
                      Text('The collection', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: navy)),
                    ],
                  ),
                ),
                Text('${products.length} finds', style: const TextStyle(color: Color(0xFF776A70), fontSize: 11, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 13),
            Builder(
              builder: (context) {
                final visibleProducts = products.where((product) {
                  final matchesSearch = product.name.toLowerCase().contains(searchQuery) ||
                      product.description.toLowerCase().contains(searchQuery);
                  final matchesCategory = selectedCategory == 'All' || product.category == selectedCategory;
                  return matchesSearch && matchesCategory;
                }).toList();

                if (visibleProducts.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(26),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                    child: const Column(children: [
                      Icon(Icons.search_off_rounded, color: blue, size: 34),
                      SizedBox(height: 8),
                      Text('No finds match that search.', style: TextStyle(color: navy, fontWeight: FontWeight.w600)),
                      SizedBox(height: 3),
                      Text('Try another name or category.', style: TextStyle(color: Color(0xFF776A70), fontSize: 12)),
                    ]),
                  );
                }

                return Column(
                  children: visibleProducts.asMap().entries.map((entry) {
                    final index = entry.key;
                    final product = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ProductCard(
                        product: product,
                        onTap: () => openDetails(product),
                        onFavourite: () {
                          setState(() => product.favourite = !product.favourite);
                          showMessage(product.favourite ? 'Added to favourites' : 'Removed from favourites');
                        },
                        onLongPress: () => showMessage('${product.name} • Rs. ${product.price.toStringAsFixed(0)}'),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(height: 7),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
              decoration: BoxDecoration(color: const Color(0xFFE9EDE7), borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  const Icon(Icons.touch_app_outlined, color: navy, size: 22),
                  const SizedBox(width: 10),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('A little something extra', style: TextStyle(color: navy, fontWeight: FontWeight.bold, fontSize: 12)),
                    SizedBox(height: 3),
                    Text('Explore gestures and animation demos.', style: TextStyle(color: Color(0xFF68766B), fontSize: 10)),
                  ])),
                  IconButton(onPressed: openGestures, icon: const Icon(Icons.arrow_forward_rounded, color: terracotta)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(22, 58, 22, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [navy, blue]),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(radius: 27, backgroundColor: Colors.white, child: Icon(Icons.shopping_bag_rounded, color: blue, size: 30)),
                SizedBox(height: 14),
                Text('QuickShop', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold)),
                Text('Your simple shopping space', style: TextStyle(color: Color(0xFFDCEBFF))),
              ],
            ),
          ),
          _drawerItem(Icons.home_rounded, 'Home', () => Navigator.pop(context)),
          _drawerItem(Icons.inventory_2_outlined, 'Products', () => Navigator.pop(context)),
          _drawerItem(Icons.add_box_outlined, 'Add Product', openAddProduct),
          _drawerItem(Icons.language_rounded, 'WebView', openWebView),
          _drawerItem(Icons.gesture_rounded, 'Gestures & Animation', openGestures),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Mobile Computing • Lab Assignment 1', style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback action) {
    return ListTile(
      leading: Icon(icon, color: navy),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: action,
    );
  }
}
