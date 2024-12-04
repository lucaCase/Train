import 'package:flutter/material.dart';
import 'package:train/common/routes.dart';
import 'package:train/components/circle_button.dart';
import 'package:train/dto/exercise.dart';

class Train extends StatefulWidget {
  const Train({super.key});

  @override
  State<Train> createState() => _TrainState();
}

class _TrainState extends State<Train> {
  List<Exercise> exercises = [];
  int currentExerciseIndex = 0;
  int currentSet = 1;

  @override
  Widget build(BuildContext context) {
    exercises = ModalRoute.of(context)!.settings.arguments as List<Exercise>;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  exercises[currentExerciseIndex].name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Set $currentSet of ${exercises[currentExerciseIndex].sets}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            CircleButton(
              onPressed: () {
                setState(() {
                  if (currentSet < exercises[currentExerciseIndex].sets) {
                    currentSet++;
                  } else {
                    currentSet = 1;
                    if (currentExerciseIndex < exercises.length - 1) {
                      currentExerciseIndex++;
                    } else {
                      Navigator.of(context).pop();
                      return;
                    }
                  }

                });
                print("HALLO");
                Navigator.of(context).pushNamed(restRoute,
                    arguments: exercises[currentExerciseIndex].rest);
              },
              icon: Icons.done,
            ),
            Text(
              currentExerciseIndex + 1 < exercises.length ? 'Next: ${exercises[currentExerciseIndex + 1].name}' : "",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
