import 'package:flutter/material.dart';

void main() async {
  runApp(const _App());
}

class _App extends StatefulWidget {
  const _App({Key? key}) : super(key: key);

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Flutter Practice',
      debugShowCheckedModeBanner: false,
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
  List<DropdownMenuItem<int>> dropdownItems = [
    const DropdownMenuItem(value: 0, child: Text('Choose the number'))
  ];
  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 1; i <= 5; i++) {
      dropdownItems.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text('Flutter Practice',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
                value: selectedItem,
                hint: const Text('hello'),
                items: dropdownItems,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    selectedItem = value!;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
