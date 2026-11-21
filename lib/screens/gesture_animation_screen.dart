import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GestureAnimationScreen extends StatefulWidget {
  final ValueChanged<int> onCounterChanged;
  final int initialCounter;

  const GestureAnimationScreen({
    super.key,
    required this.onCounterChanged,
    required this.initialCounter,
  });

  @override
  State<GestureAnimationScreen> createState() => _GestureAnimationScreenState();
}

class _GestureAnimationScreenState extends State<GestureAnimationScreen> {
  late int counter;
  bool expanded = false;
  bool visible = true;
  double horizontalDrag = 0;
  double verticalDrag = 0;
  String gestureMessage = 'Try the gestures below!';

  @override
  void initState() {
    super.initState();
    counter = widget.initialCounter;
  }

  void updateCounter(int value) {
    setState(() => counter = value);
    widget.onCounterChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestures & Animation')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Gesture Playground', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: navy)),
          const SizedBox(height: 6),
          const Text('Use the product tile to test the five required gesture callbacks.', style: TextStyle(color: Colors.blueGrey)),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () => setState(() => gestureMessage = 'onTap: You tapped the tile!'),
            onDoubleTap: () => setState(() => gestureMessage = 'onDoubleTap: Great! You double-tapped.'),
            onLongPress: () => setState(() => gestureMessage = 'onLongPress: You held the tile.'),
            onHorizontalDragUpdate: (details) => setState(() {
              horizontalDrag += details.delta.dx;
              gestureMessage = 'onHorizontalDrag: ${horizontalDrag.toStringAsFixed(0)} px';
            }),
            onVerticalDragUpdate: (details) => setState(() {
              verticalDrag += details.delta.dy;
              gestureMessage = 'onVerticalDrag: ${verticalDrag.toStringAsFixed(0)} px';
            }),
            child: Container(
              height: 145,
              decoration: BoxDecoration(color: paleBlue, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFD4E5FA))),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.touch_app_rounded, color: blue, size: 42),
                  SizedBox(height: 8),
                  Text('Tap • Double-tap • Long-press', style: TextStyle(fontWeight: FontWeight.bold, color: navy)),
                  Text('Swipe left/right or up/down', style: TextStyle(color: Colors.blueGrey)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
            child: Text(gestureMessage, style: const TextStyle(color: navy, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 25),
          const Text('Animated Widget', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: navy)),
          const SizedBox(height: 10),
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeInOut,
              height: expanded ? 145 : 95,
              width: expanded ? 250 : 170,
              decoration: BoxDecoration(
                color: expanded ? blue : navy,
                borderRadius: BorderRadius.circular(expanded ? 28 : 16),
              ),
              child: const Icon(Icons.shopping_bag_rounded, color: Colors.white, size: 42),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => setState(() => expanded = !expanded),
            child: Text(expanded ? 'Shrink Widget' : 'Animate Widget'),
          ),
          const SizedBox(height: 24),
          const Text('State Management – Counter', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: navy)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                Text('$counter', style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: blue)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: () => updateCounter(counter - 1),
                      icon: const Icon(Icons.remove),
                      label: const Text('Decrement'),
                      style: FilledButton.styleFrom(backgroundColor: navy),
                    ),
                    const SizedBox(width: 10),
                    FilledButton.icon(
                      onPressed: () => updateCounter(counter + 1),
                      icon: const Icon(Icons.add),
                      label: const Text('Increment'),
                      style: FilledButton.styleFrom(backgroundColor: blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
