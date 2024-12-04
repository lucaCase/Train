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
            CircleButton(onPressed: () {
              Navigator.of(context).pushNamed(restRoute, arguments: exercises[currentExerciseIndex].rest);
            }, icon: Icons.done,),
          ]
        ),
      ),
    );
  }
}
