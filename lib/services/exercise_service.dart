import 'package:train/dto/exercise.dart';

class ExerciseService {
  static String assembleExerciseString(Exercise exercise) {
    String baseString = "${exercise.sets} sets";

    if (exercise.reps != null) {
      baseString += " of ${exercise.reps} reps";
    }

    if (exercise.weight != null) {
      baseString += " - ${exercise.weight}kg";
    }

    return baseString;
  }
}