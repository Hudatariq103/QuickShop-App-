import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../theme/app_theme.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  WebViewController? controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (_) {
              if (mounted) setState(() => isLoading = true);
            },
            onPageFinished: (_) {
              if (mounted) setState(() => isLoading = false);
            },
            onWebResourceError: (_) {
              if (mounted) setState(() => isLoading = false);
            },
          ),
        )
        ..loadRequest(Uri.parse('https://www.wikipedia.org'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuickShop WebView'),
        actions: [
          if (!kIsWeb)
            IconButton(
              tooltip: 'Reload',
              onPressed: () => controller?.reload(),
              icon: const Icon(Icons.refresh),
            ),
        ],
      ),
      body: kIsWeb
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.web_rounded, size: 60, color: terracotta),
                    SizedBox(height: 16),
                    Text(
                      'WebView is available on Android',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: navy),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Run this feature on an Android emulator or physical device.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF756970)),
                    ),
                  ],
                ),
              ),
            )
          : Stack(
              children: [
                WebViewWidget(controller: controller!),
                if (isLoading) const LinearProgressIndicator(color: blue),
              ],
            ),
    );
  }
}
