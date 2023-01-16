import 'package:flutter/material.dart';

void main() {
  runApp(
    const _App(),
  );
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter CodeFactory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
            child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
                width: 300,
                height: 500,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Welcome',
                          style: TextStyle(fontSize: 30, color: Colors.black)),
                      const SizedBox(height: 20),
                      const Text('이메일과 비밀번호를 입력하여 로그인해주세요',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 50),
                      Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const FlutterLogo(size: 150),
                              const SizedBox(height: 30),
                              SizedBox(child: TextFormField()),
                              SizedBox(child: TextFormField()),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    child: const Text('로그인')),
                              ),
                              SizedBox(
                                width: 300,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey),
                                    child: const Text('회원가입')),
                              ),
                            ]),
                      ),
                    ])),
          ],
        )),
      ),
    );
  }
}
