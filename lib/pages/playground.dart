import 'package:flutter/material.dart';
import 'package:muscle_selector/muscle_selector.dart';

class Playground extends StatefulWidget {
  Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  Set<Muscle>? selectedMuscles;

  final GlobalKey<MusclePickerMapState> _mapKey = GlobalKey<MusclePickerMapState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          scaleEnabled: true,
          panEnabled: true,
          constrained: true,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Align(
              alignment: Alignment.center,
              child: Transform.scale(
                scale: 1.2,
                child: MusclePickerMap(
                  key: _mapKey,
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 4,
                  map: Maps.BODY,
                  isEditing: false,
                  initialSelectedGroups: const ["chest", "glutes", "neck", "lower_back"],
                  onChanged: (muscles) {
                    setState(() {
                      selectedMuscles = muscles;
                      muscles.forEach((muscle) {
                        print(muscle.title);
                      });
                    });
                  },
                  actAsToggle: true,
                  dotColor: Colors.green,
                  selectedColor: Colors.red,
                  strokeColor: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
