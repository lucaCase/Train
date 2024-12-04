import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class Rest extends StatefulWidget {
  Rest({super.key});

  @override
  State<Rest> createState() => _RestState();
}

class _RestState extends State<Rest> {
  int duration = 0;
  static const vibrationDuration = 500;

  @override
  Widget build(BuildContext context) {
    duration = ModalRoute.of(context)!.settings.arguments as int;


    Future.delayed(Duration(seconds: duration), () async {
        if ((await Vibration.hasVibrator() ?? false)) {
          Vibration.vibrate(duration: vibrationDuration, amplitude: 120);
          Future.delayed(const Duration(milliseconds: vibrationDuration), () {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          });
        }
    });

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: (duration).toDouble()),
              duration: Duration(seconds: duration),
              builder: (context, value, _) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: value / duration,
                      strokeWidth: 20,
                      strokeAlign: 8,
                      color: const Color(0xF403A7F7),
                    ),
                    Text(
                      "${(duration - value).ceil()}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}