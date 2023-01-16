import 'package:flutter/material.dart';


// 페이지 전환 버튼
class RoutingButton extends StatelessWidget {
  final String? routeName;
  final String? btnText;
  final Color? color;

  const RoutingButton(
      {Key? key,
        required this.routeName,
        this.btnText = '클릭',
        this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, routeName!);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 50),
            backgroundColor: color!,
            elevation: 4,
            shadowColor: Colors.black,
          ),
          child: Text(
            btnText!,
            style: TextStyle(
              fontFamily: 'tenada',
              fontSize: 20,
              color: color != Colors.white ? Colors.white : Colors.black,
            ),
          )),
    );
  }
}