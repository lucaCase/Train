import 'package:flutter/material.dart';
import 'package:train/common/routes.dart';
import 'package:train/components/exercise_component.dart';
import 'package:train/dto/exercise.dart';
import 'package:train/services/workout_service.dart';

import '../components/styled_button.dart';
import '../services/weekday_service.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> with WidgetsBindingObserver {
  WorkoutService workoutService = WorkoutService();
  String weekday = WeekdayService.getCurrentWeekday();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    setState(() {
      weekday = WeekdayService.getCurrentWeekday();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      setState(() {
        weekday = WeekdayService.getCurrentWeekday();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Workout on $weekday",
                style: const TextStyle(color: Colors.white, fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
            FutureBuilder(
                future: workoutService.getWorkouts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    throw snapshot.error!;
                  } else {
                    List<Exercise> exercises = snapshot
                        .data![DateTime.now().weekday - 1]
                        .exercises;
                    bool isWorkoutToday = exercises
                        .isNotEmpty;
                    if (!isWorkoutToday) {
                      return const Center(
                        child: Text(
                          "No workout today!",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return Column(
                      children: [
                        StyledButton(onPressed: () {
                          Navigator.of(context).pushNamed(workoutStartRoute, arguments: exercises);
                        }, text: "Start workout",),
                        ...exercises.map((exercise) => ExerciseComponent(exercise: exercise)),
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
