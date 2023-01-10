import 'package:flutter/material.dart';

class ElevatedTextWidget extends StatelessWidget {

  final Widget childButton;
  final Function onPressed;

  const ElevatedTextWidget({
    super.key, 
    required this.childButton, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed(),
      child: childButton
    );
  }
}