import 'package:flutter/material.dart';
import 'package:train/common/routes.dart';
import 'package:train/components/circle_button.dart';
import 'package:train/dto/exercise.dart';

import '../dto/result.dart';

class Train extends StatefulWidget {
  const Train({super.key});

  @override
  State<Train> createState() => _TrainState();
}

class _TrainState extends State<Train> {
  List<Exercise> exercises = [];
  int currentExerciseIndex = 0;
  int currentSet = 1;
  List<Result> results = [];
  Stopwatch stopWatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    stopWatch.start();
  }

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
                results.add(Result(
                    exerciseName: exercises[currentExerciseIndex].name,
                    duration: stopWatch.elapsedMilliseconds,
                    set: currentSet));
                stopWatch.reset();
                setState(() {
                  if (currentSet < exercises[currentExerciseIndex].sets) {
                    currentSet++;
                    _navigateToRest();
                  } else {
                    currentSet = 1;
                    if (currentExerciseIndex < exercises.length - 1) {
                      currentExerciseIndex++;
                      _navigateToRest();
                    } else {
                      Navigator.of(context)
                          .pushNamed(resultRoute, arguments: results);
                    }
                  }
                });
              },
              icon: Icons.done,
            ),
            Text(
              currentExerciseIndex + 1 < exercises.length
                  ? 'Next: ${exercises[currentExerciseIndex + 1].name}'
                  : "",
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

  void _navigateToRest() {
    Navigator.of(context)
        .pushNamed(restRoute, arguments: exercises[currentExerciseIndex].rest)
        .then((_) {
      stopWatch.start();
      print("Hello");
    });
  }
}
