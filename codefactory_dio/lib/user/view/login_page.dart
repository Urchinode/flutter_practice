import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../global/const/colors.dart';
import '../../global/widget/custom_text_field.dart';
import '../../global/view/root_tab.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String id = '';
  String password = '';

  @override
  Widget build(BuildContext context) {

    // RESTful API 사용을 위한 클래스
    final dio = Dio();

    // 플랫폼 별 API 요청 경로 설정
    const emulatorIp = 'http://192.168.1.235:3000'; // 집 와이파이 이용
    const simulatorIp = 'http://127.0.0.1:3000';

    final ip = Platform.isAndroid ? emulatorIp : simulatorIp;

    return Scaffold(
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
                CustomTextField(
                  hintText: '이메일',
                  onChanged: (String value) {
                    setState(() {
                      id = value;
                      print(id);
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: '비밀번호',
                  obscureText: true,
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () async {
                      final rawString = '$id:$password';

                      Codec<String, String> stringToBase64 =
                      utf8.fuse(base64);

                      String token = stringToBase64.encode(rawString);

                      final response = await dio.post('$ip/auth/login',
                          options: Options(
                              headers: {'authorization': 'Basic $token'}));
                      if(!mounted) return;
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => RootTab()));
                      print(response.data);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: PRIMARY_COLOR),
                    child: const Text('로그인')),
                TextButton(onPressed: () {}, child: const Text('회원가입'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
