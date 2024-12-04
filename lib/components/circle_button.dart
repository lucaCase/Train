import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton({super.key, required this.onPressed, required this.icon});

  Function onPressed;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 3)),
      ),
      child: IconButton(
        highlightColor: Colors.white.withAlpha(30),
        onPressed: () => onPressed(),
        icon: Icon(icon, color: Colors.white, size: 90,),
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
