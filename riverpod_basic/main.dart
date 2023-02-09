import 'package:flutter/material.dart';
import 'package:flutter_codefactory/user/test/riverpod_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider((_) => 'Hello World');

void main() {
  runApp(
    const ProviderScope(child: _App()),
  );
}

class _App extends StatefulWidget {
  const _App({Key? key}) : super(key: key);

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CodeFactory',
      home: RiverPodTestPage(),
    );
  }
}
