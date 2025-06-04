import '../entities/exercise_model.dart';

abstract class ExerciseRepository {
  Future<void> addExercise(String sessionId, ExerciseModel exercise);
  Future<List<ExerciseModel>> getExercises(String sessionId);
  Future<void> deleteExercise(String sessionId, String exerciseId);
  Future<void> updateExercise(String sessionId, ExerciseModel exercise);
}
