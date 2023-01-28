import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool isobscure;
  final IconData? iconPrefix;
  final IconData? iconSuffixIcon;
  const TextInputField(
      {Key? key,
      required this.controller,
      this.labelText,
      this.isobscure = false,
      this.iconPrefix, this.iconSuffixIcon, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(iconPrefix),
        suffixIcon: Icon(iconSuffixIcon),
        labelStyle: const TextStyle(fontSize: 17),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      obscureText: isobscure,
    );
  }
}
