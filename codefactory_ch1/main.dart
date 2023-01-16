import 'package:flutter/material.dart';

import './global/const/colors.dart';
import './global/widget/custom_text_field.dart';

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
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SafeArea(
            top: true,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Welcome',
                      style: TextStyle(fontSize: 30, color: Colors.black)),
                  const SizedBox(height: 16.0),
                  const Text('이메일과 비밀번호를 입력하여 로그인해주세요',
                      style: TextStyle(fontSize: 14, color: BODY_TEXT_COLOR)),
                  const SizedBox(height: 50),
                  const Center(child: FlutterLogo(size: 200)),
                  const SizedBox(height: 30),
                  const CustomTextField(
                    hintText: '이메일',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextField(
                    hintText: '비밀번호',
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: PRIMARY_COLOR),
                      child: const Text('로그인')),
                  TextButton(onPressed: () {}, child: const Text('회원가입'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
