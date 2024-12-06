import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../dto/result.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  List<Result> results = [];

  @override
  Widget build(BuildContext context) {
    WakelockPlus.disable();

    results = ModalRoute.of(context)!.settings.arguments as List<Result>;
    print(results);

    return const Placeholder();
  }
}
