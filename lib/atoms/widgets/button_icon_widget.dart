import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  final Function onTap;
  final Color? colorButton;
  final Widget childButton;
  final Widget labelButton;

  const ButtonIconWidget({
    super.key, 
    required this.onTap, 
    this.colorButton, 
    required this.childButton, 
    required this.labelButton, 
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap(),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.fromLTRB(15, 5, 20, 5),
        ),
        backgroundColor: MaterialStateProperty.all(
          colorButton
        )
      ),
      icon: childButton, 
      label: labelButton,
    );
  }
}