import 'package:flutter/material.dart';

class WorkoutStart extends StatelessWidget {
  const WorkoutStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 3),
          duration: const Duration(seconds: 3),
          builder: (context, value, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: value / 3,
                  strokeWidth: 20,
                  strokeAlign: 8,
                  color: const Color(0xF403A7F7),
                ),
                Text(
                  "${(3 - value).ceil()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
