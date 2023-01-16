import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

import '../../models/color_provider.dart';

// Gradation Lab 팔레트 버튼
class InkButton extends StatelessWidget {
  final Color? color;

  const InkButton({Key? key, this.color = Colors.black}) : super(key: key);

  final blurRadius = 2.0;
  final offset = const Offset(1, 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CustomColor>().changeColor(color!);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
            boxShadow: [
              BoxShadow(
                  blurRadius: blurRadius,
                  offset: offset,
                  color: Colors.black,
                  inset: color == context.watch<CustomColor>().color
                      ? true
                      : false),
            ],
          ),
        ),
      ),
    );
  }
}