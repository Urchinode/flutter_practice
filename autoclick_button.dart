import 'package:flutter/material.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: bgColor,
        child: Center(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    bgColor = bgColor == Colors.white
                        ? Colors.black
                        : bgColor == Colors.black
                            ? Colors.red
                            : bgColor == Colors.red
                                ? Colors.blue
                                : Colors.white;
                  });
                },
                child: const Text('Press'))));
  }
}
