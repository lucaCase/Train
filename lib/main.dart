import 'package:flutter/material.dart';
import 'package:train/pages/playground.dart';
import 'package:train/pages/workout_start.dart';

import 'common/routes.dart';
import 'pages/calendar.dart';
import 'pages/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        calendarRoute: (context) => const Calendar(),
      },
    );
  }
}