class SessionModel {
  final String id;
  final String userId;
  final DateTime date;
  final String? notes;

  SessionModel({
    required this.id,
    required this.userId,
    required this.date,
    this.notes,
  });

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'date': date.toIso8601String(), 'notes': notes};
  }

  factory SessionModel.fromMap(String id, Map<String, dynamic> map) {
    return SessionModel(
      id: id,
      userId: map['userId'],
      date: DateTime.parse(map['date']),
      notes: map['notes'],
    );
  }
}
