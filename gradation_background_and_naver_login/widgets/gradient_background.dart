import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF701ebd),
            Color(0xFF873bcc),
            Color(0xFFfe4a97),
            Color(0xFFe17763),
            Color(0xFF68998c)
          ],
        ),
      ),
    );
  }
}
