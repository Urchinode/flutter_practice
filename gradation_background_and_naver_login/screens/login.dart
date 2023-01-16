import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

import '../global/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //네이버 로그인
  Future<NaverLoginResult?> signInWithNaver() async {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();

    if (result.status == NaverLoginStatus.loggedIn) {
      return result;
    } else {
      print('Failed to login with Naver');
      return null;
    }
  }

  // 네이버 로그아웃
  Future<NaverLoginResult?> signOutWithNaver() async {
    final NaverLoginResult result = await FlutterNaverLogin.logOut();
    if (result.status == NaverLoginStatus.cancelledByUser) {
      return result;
    } else {
      print('Failed to logout with Naver');
      return null;
    }
  }

  NaverLoginResult? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Login', style: CustomTextStyle.lightAppBarTextStyle(context)),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: data?.status == NaverLoginStatus.loggedIn
          ? Colors.greenAccent
          : Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          data?.status != NaverLoginStatus.loggedIn
              ? ElevatedButton(
                  onPressed: () async {
                    if (data?.status != NaverLoginStatus.loggedIn) {
                      NaverLoginResult? result = await signInWithNaver();
                      print(result);
                      setState(() {
                        data = result!;
                      });
                    } else {
                      print('Already Logged In');
                      print(data);
                    }
                  },
                  child: Text('Login',
                      style: Theme.of(context).textTheme.bodySmall),
                )
              : ElevatedButton(
                  onPressed: () async {
                    if (data?.status == NaverLoginStatus.loggedIn) {
                      NaverLoginResult? result = await signOutWithNaver();
                      print(result);
                      setState(() {
                        data = result!;
                      });
                    } else {
                      print('Already Logged out');
                      print(data);
                    }
                  },
                  child: Text('Logout',
                      style: Theme.of(context).textTheme.bodySmall)),
          const SizedBox(height: 50),
          data?.status == NaverLoginStatus.loggedIn
              ? Column(children: [
                  Text('Hello!', style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 20),
                  Text(data!.account.email,
                      style: Theme.of(context).textTheme.bodySmall)
                ])
              : Text('Log In with Naver',
                  style: Theme.of(context).textTheme.bodySmall)
        ],
      )),
    );
  }
}
