import 'package:flutter/material.dart';

class UnborderdTextField extends StatelessWidget {
  const UnborderdTextField(
      {Key? key, this.hintText, this.obscureText = false, this.controller})
      : super(key: key);
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.subtitle2,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
