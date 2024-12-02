import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:train/dto/quote.dart';

class QuoteService {
  static const String _API_URL = "https://api.realinspire.tech/v1/quotes/random";

  Future<Quote> fetchQuote() async {
    final uri = Uri.parse(_API_URL);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return Quote.fromJson(jsonDecode(response.body)[0]);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}