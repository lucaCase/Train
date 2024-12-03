import 'package:flutter/material.dart';
import 'package:muscle_selector/muscle_selector.dart';

class Body extends StatelessWidget {
  Body({super.key, required this.groups});

  Set<Muscle>? selectedMuscles;
  final List<String> groups;

  final GlobalKey<MusclePickerMapState> _mapKey = GlobalKey<MusclePickerMapState>();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        scaleEnabled: true,
          child: Align(
        alignment: Alignment.center,
        child: IgnorePointer(
          child: MusclePickerMap(
            key: _mapKey,
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 4,
            map: Maps.BODY,
            initialSelectedGroups: groups,
            onChanged: (selected) {},
            dotColor: Colors.green,
            selectedColor: Colors.red,
            strokeColor: Colors.black,
          ),
        ),
      )),
    );
  }
}
