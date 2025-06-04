class ExerciseModel {
  final String id;
  final String name;
  final String? notes;

  ExerciseModel({required this.id, required this.name, this.notes});

  Map<String, dynamic> toMap() {
    return {'name': name, 'notes': notes};
  }

  factory ExerciseModel.fromMap(String id, Map<String, dynamic> map) {
    return ExerciseModel(id: id, name: map['name'], notes: map['notes']);
  }
}
