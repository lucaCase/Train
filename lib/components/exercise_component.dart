import 'package:flutter/material.dart';
import 'package:train/components/body.dart';
import 'package:train/services/exercise_service.dart';
import '../dto/exercise.dart';

class ExerciseComponent extends StatelessWidget {
  const ExerciseComponent({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    exercise.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    if (exercise.description != null)
                      Text(
                        exercise.description!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    if (exercise.parts != null)
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          const Text("Addressed muscle groups:", textAlign: TextAlign.start, style: TextStyle(fontSize: 14),),
                          const SizedBox(height: 8),
                          Body(groups: exercise.parts!),
                        Text(ExerciseService.assembleExerciseString(exercise), style: const TextStyle(fontSize: 16),)
                        ],
                      ),
                  ]),
                );
              });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/background.jpg",
                  height: 84,
                  width: 84,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      exercise.name,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ExerciseService.assembleExerciseString(exercise),
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 2 / 3,
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text("2/3")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
