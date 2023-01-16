import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global/colors.dart';
import '../models/color_provider.dart';
import './screens/gradation_main.dart';
import './screens/gradation_normal.dart';
import './screens/gradation_linear.dart';
import './screens/login.dart';
import 'widgets/buttons/routing_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => CustomColor()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.brown,
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            // AppBar 텍스트
            headlineLarge: TextStyle(
                fontFamily: 'tenada', fontSize: 24, color: Colors.white),
            // Information
            bodySmall: TextStyle(
                fontFamily: 'tenada', fontSize: 18, color: darkGreen),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/grd_main': (context) => const GradationPage(),
          '/grd_normal': (context) => const NormalBackgroundPage(),
          '/grd_linear': (context) => const LinearGradientPage(),
          '/login_naver': (context) => const LoginPage(),
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Playground',
            style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            RoutingButton(
                routeName: '/grd_main', btnText: 'Gradation', color: desert),
            RoutingButton(
                routeName: '/login_naver',
                btnText: '네이버 로그인',
                color: Colors.greenAccent)
          ],
        ),
      ),
    );
  }
}
