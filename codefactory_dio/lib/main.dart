import 'package:flutter/material.dart';
import 'package:flutter_codefactory/user/view/login_page.dart';


void main() {
  runApp(
    const _App(),
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
      home: LoginPage(),
    );
  }
}
