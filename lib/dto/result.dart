class Result {
  final String exerciseName;
  final int set;
  final int duration;

  Result({required this.exerciseName, required this.set, required this.duration});

  @override
  String toString() {
    return 'Result{exerciseName: $exerciseName, set: $set, duration: $duration ms}';
  }
}