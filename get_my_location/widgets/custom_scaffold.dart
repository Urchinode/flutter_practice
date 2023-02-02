import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({super.key, this.appBarName, required this.body});

  final Widget body;
  final String? appBarName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarName ?? 'Default App',
            style: const TextStyle(
                color: Colors.yellow, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: body,
    );
  }
}
