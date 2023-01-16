import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Practice',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _logoSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Practice',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _logoSize = Random().nextInt(200).toDouble() + 100;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: Colors.blue,
            width: _logoSize,
            height: _logoSize,
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
