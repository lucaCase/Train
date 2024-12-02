import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:train/dto/workout.dart';

class WorkoutService {
  Future<List<Workout>> getWorkouts() async {
    try {
      List<Workout> workouts = [];

      final String contents = await rootBundle.loadString('assets/workout_plan.json');
      final List<dynamic> json = jsonDecode(contents);
      for (var workout in json) {
        workouts.add(Workout.fromJson(workout));
      }


      return workouts;
    } catch (e) {
      rethrow;
    }
  }
}