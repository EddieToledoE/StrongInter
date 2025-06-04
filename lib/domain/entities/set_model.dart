class SetModel {
  final String id;
  final double weight;
  final int reps;
  final int? restTime; // en segundos

  SetModel({
    required this.id,
    required this.weight,
    required this.reps,
    this.restTime,
  });

  Map<String, dynamic> toMap() {
    return {'weight': weight, 'reps': reps, 'restTime': restTime};
  }

  factory SetModel.fromMap(String id, Map<String, dynamic> map) {
    return SetModel(
      id: id,
      weight: (map['weight'] as num).toDouble(),
      reps: map['reps'],
      restTime: map['restTime'],
    );
  }
}
