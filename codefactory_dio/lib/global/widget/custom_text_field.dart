import 'package:flutter/material.dart';
import '../const/colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool? obscureText;
  final bool? autoFocus;
  final ValueChanged<String>? onChanged;

  const CustomTextField(
      {this.hintText,
      this.obscureText = false,
      this.autoFocus = false,
      this.onChanged,
      Key? key})
      : super(key: key);

  @override
  // DECORATION -> TextFormField의 너비 조절
  // border 자체는 테두리 기본 스타일 환경이고 실제로 렌더링하려면 enabledBorder 같은거로 처리해야함
  Widget build(BuildContext context) {
    const outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1.0, color: INPUT_BORDER_COLOR),
    );
    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText!,
      autofocus: autoFocus!,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: outlineBorder,
          focusedBorder: outlineBorder.copyWith(
              borderSide:
                  outlineBorder.borderSide.copyWith(color: PRIMARY_COLOR)),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: BODY_TEXT_COLOR),
          contentPadding: const EdgeInsets.all(10.0),
          fillColor: INPUT_BG_COLOR,
          filled: true),
    );
  }
}
