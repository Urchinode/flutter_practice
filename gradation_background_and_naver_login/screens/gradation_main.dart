import 'package:flutter/material.dart';

import '../global/colors.dart';
import '../widgets/buttons/routing_button.dart';

class GradationPage extends StatelessWidget {
  const GradationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //그림자 없애기
        backgroundColor: desert,
        title:
            Text('Gradation Lab', style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          RoutingButton(routeName: '/grd_normal', btnText: '전체 배경', color: desert),
          RoutingButton(routeName: '/grd_linear', btnText: '그라데이션', color: desert),
          // Button(), 화면 깜빡거리게 해보자
        ],
      )),
    );
  }
}
