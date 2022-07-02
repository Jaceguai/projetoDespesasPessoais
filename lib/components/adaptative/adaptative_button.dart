import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "dart:io";

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const AdaptativeButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            color:Theme.of(context).colorScheme.primary ,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(label),
          )
        : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary),
                  ),
                  onPressed: onPressed,
                  child: const Text(
                    "label",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
  }
}
