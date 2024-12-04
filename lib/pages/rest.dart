import 'package:flutter/material.dart';

class Rest extends StatelessWidget {
  Rest({super.key});

  int duration = 0;

  @override
  Widget build(BuildContext context) {
    duration = ModalRoute.of(context)!.settings.arguments as int;

    Future.delayed(Duration(seconds: duration), () {
      if (context.mounted) {
        Navigator.of(context).pop();
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