import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "dart:io";

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  final String label;
  const AdaptativeTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.onSubmitted,
    required this. label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            placeholder: label,
            onSubmitted: onSubmitted,
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 12,
            ),

          ),
        )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted:onSubmitted,
            decoration:  InputDecoration(labelText: label),
          );
  }
}
