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

                return CircularProgressIndicator(value: value / 3, strokeWidth: 10, strokeAlign: 10, color: const Color(0xF403A7F7),);
              })),
    );
  }
}
