import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  StyledButton({super.key, required this.onPressed, required this.text});

  Function onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () => onPressed(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: const Color(0xF403A7F7),
            ),
            child: Text(text, style: const TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
