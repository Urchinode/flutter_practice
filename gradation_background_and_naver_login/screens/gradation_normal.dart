import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../global/text_style.dart';
import '../models/color_provider.dart';
import '../widgets/buttons/change_color_floating_button.dart';

class NormalBackgroundPage extends StatelessWidget {
  const NormalBackgroundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<CustomColor>().color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.watch<CustomColor>().color,
        title: Text('전체 배경',
            style: context.watch<CustomColor>().color == Colors.white
                ? CustomTextStyle.lightAppBarTextStyle(context)
                : Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
      ),
      body: Stack(children: const [
        Center(child: FlutterLogo(size: 200)),
        Align(
            alignment: Alignment.bottomCenter,
            child: ChangeColorFloatingActionButton()),
      ]),
    );
  }
}
