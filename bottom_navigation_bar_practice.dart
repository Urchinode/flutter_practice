import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavController = 0;

  static final dynamic _pages = [
    const Icon(Icons.call, size: 100),
    const Icon(Icons.camera, size: 100),
    const Icon(Icons.people, size: 100),
    ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(title: Text(index.toString()));
      },
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Practice'),
      ),
      body: Center(
        child: _pages[_bottomNavController],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black,
        currentIndex: _bottomNavController,
        selectedIconTheme: const IconThemeData(color: Colors.greenAccent),
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white,
        selectedFontSize: 16.0,
        unselectedFontSize: 14.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Call',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Photo',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Social',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.dangerous),
              label: 'Setting',
              backgroundColor: Colors.black,
              activeIcon: Icon(Icons.settings_accessibility)),
        ],
        onTap: (int number) {
          setState(() {
            _bottomNavController = number;
          });
        },
      ),
    );
  }
}
