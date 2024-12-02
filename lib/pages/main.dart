import 'package:flutter/material.dart';
import 'package:train/dto/quote.dart';
import 'package:train/pages/quotes.dart';
import 'package:train/pages/workout.dart';
import 'package:train/services/weekday_service.dart';

import '../services/quote_service.dart';

class Main extends StatefulWidget {
  Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Future<Quote>? quote;

  @override
  Widget build(BuildContext context) {
    final QuoteService quoteService = QuoteService();

    quote = quote ?? quoteService.fetchQuote();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            quote = quoteService.fetchQuote();
          });
        },
        child: const Icon(Icons.format_quote),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            colorFilter: ColorFilter.mode(
              Color(0x80000000),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            Quotes(
              quote: quote!,
            ),
            Workout(),
          ],
        ),
      ),
    );
  }
}
