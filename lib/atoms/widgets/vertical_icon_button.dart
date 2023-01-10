import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final Color? colorIcon;

  const VerticalIconButton({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.onTap, 
    this.colorIcon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Column(
        children: [
          Icon(icon, color: colorIcon ?? Colors.white ),
          const SizedBox(height: 4,),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}