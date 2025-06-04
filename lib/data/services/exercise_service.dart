import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/exercise_model.dart';

class ExerciseService {
  CollectionReference<Map<String, dynamic>> _exerciseRef(String sessionId) {
    return FirebaseFirestore.instance
        .collection('sessions')
        .doc(sessionId)
        .collection('exercises');
  }

  Future<void> addExercise(String sessionId, ExerciseModel exercise) async {
    await _exerciseRef(sessionId).doc(exercise.id).set(exercise.toMap());
  }

  Future<List<ExerciseModel>> getExercises(String sessionId) async {
    final query = await _exerciseRef(sessionId).get();
    return query.docs
        .map((doc) => ExerciseModel.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> deleteExercise(String sessionId, String exerciseId) async {
    await _exerciseRef(sessionId).doc(exerciseId).delete();
  }

  Future<void> updateExercise(String sessionId, ExerciseModel exercise) async {
    await _exerciseRef(sessionId).doc(exercise.id).update(exercise.toMap());
  }
}
