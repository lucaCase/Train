import 'package:flutter/material.dart';
import 'package:train/common/routes.dart';
import 'package:train/dto/exercise.dart';

class WorkoutStart extends StatelessWidget {
  const WorkoutStart({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4250), () {
      if (context.mounted) {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(trainRoute,
            arguments:
                ModalRoute.of(context)!.settings.arguments as List<Exercise>);
      }
    });

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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: value == 3 ? 1 : 0,
                      child: const Text(
                        "Let's",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 150,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: value == 3 ? 1 : 0,
                      child: const Text(
                        "Begin",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 150,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
