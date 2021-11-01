import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  const AppScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loja do Stream'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: SafeArea(child: child),
      ),
    );
  }
}
