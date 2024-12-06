import 'package:flutter/material.dart';
import 'package:train/pages/playground.dart';
import 'package:train/pages/rest.dart';
import 'package:train/pages/results.dart';
import 'package:train/pages/train.dart';
import 'package:train/pages/workout_start.dart';

import 'common/routes.dart';
import 'pages/calendar.dart';
import 'pages/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: mainRoute,
      routes: {
        mainRoute: (context) => Main(),
        "/playground": (context) => Playground(),
        workoutStartRoute: (context) => const WorkoutStart(),
        restRoute: (context) => Rest(),
        trainRoute: (context) => const Train(),
        calendarRoute: (context) => const Calendar(),
        resultRoute: (context) => const Results()

      },
    );
  }
}