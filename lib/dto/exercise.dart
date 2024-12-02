class Exercise {
  final String name;
  final String? description;
  final List<String>? parts;
  final int sets;
  final int? reps;
  final int rest;
  final int? weight;
  final bool toFailure;

  Exercise({
    required this.name,
    required this.sets,
    required this.rest,
    this.description,
    this.reps,
    this.weight,
    this.parts,
    this.toFailure = false,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      description: json['description'] == null ? null : json['description'] as String,
      sets: json['sets'] as int,
      reps: json['reps'] == null ? null : json['reps'] as int,
      rest: json['rest'] as int,
      weight: json['weight'] == null ? null : json['weight'] as int,
      toFailure: json['toFailure'] == null ? false : json['toFailure'] as bool,
      parts: json['parts'] == null ? null : List<String>.from(json['parts'] as List<dynamic>),
    );
  }

  @override
  String toString() {
    return 'Exercise{name: $name, description: $description, sets: $sets, reps: $reps, rest: $rest, weight: $weight, toFailure: $toFailure}';
  }
}