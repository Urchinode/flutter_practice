import 'package:flutter/material.dart';

import '../palette.dart';

// Gradation Lab 배경색 변경 플로팅 버튼
class ChangeColorFloatingActionButton extends StatelessWidget {
  const ChangeColorFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40.0),
      child: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.grey,
              context: context,
              builder: (context) => const Palette());
        },
        backgroundColor: Colors.white,
        elevation: 2,
        label: const Text('Change Color',
            style: TextStyle(
                fontFamily: 'tenada', fontSize: 16, color: Colors.black)),
        icon: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}