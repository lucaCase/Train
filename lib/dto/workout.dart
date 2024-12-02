import 'exercise.dart';

class Workout {
  final String weekday;
  final List<Exercise> exercises = [];

  Workout({required this.weekday});

  factory Workout.fromJson(Map<String, dynamic> json) {
    final workout = Workout(weekday: json['weekday']);
    final List<dynamic> exercises = json['exercises'];
    for (var exercise in exercises) {
      workout.exercises.add(Exercise.fromJson(exercise));
    }
    return workout;
  }

  @override
  String toString() {
    return 'Workout{weekday: $weekday, exercises: $exercises}';
  }
}