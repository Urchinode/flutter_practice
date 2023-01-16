import 'package:flutter/material.dart';

import '../widgets/gradient_background.dart';

class LinearGradientPage extends StatelessWidget {
  const LinearGradientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('그라데이션', style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: Stack(
        children: const [
          GradientBackground(),
          Center(child: FlutterLogo(size: 200)),
        ],
      ),
    );
  }
}
