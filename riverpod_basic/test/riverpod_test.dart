import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class RiverPodTestPage extends ConsumerWidget {
  const RiverPodTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Template'),
      ),
      body: Center(
        child: TextButton(
          child: Text(ref.watch(helloWorldProvider)),
          onPressed: () {
            print('Hello!');
          },
        ),
      ),
    );
  }
}
