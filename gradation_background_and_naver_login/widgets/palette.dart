import 'package:flutter/material.dart';

import '../global/colors.dart';
import './buttons/ink_button.dart';

class Palette extends StatelessWidget {
  const Palette({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: Colors.grey,
          child: GridView.count(
            crossAxisCount: 5,
            children: const [
              InkButton(color: Colors.red),
              InkButton(color: Colors.orange),
              InkButton(color: desert),
              InkButton(color: Colors.greenAccent),
              InkButton(color: darkGreen),
              InkButton(color: Colors.cyan),
              InkButton(color: Colors.indigo),
              InkButton(color: Colors.purple),
              InkButton(color: Colors.brown),
              InkButton(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
