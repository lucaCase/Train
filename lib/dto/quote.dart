class Quote {
  String text;
  String author;

  Quote({required this.text, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['content'],
      author: json['author'],
    );
  }
}