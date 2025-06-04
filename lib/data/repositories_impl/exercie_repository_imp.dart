import '../../domain/entities/exercise_model.dart';
import '../../domain/repositories/exercise_repository.dart';
import '../services/exercise_service.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseService _service;

  ExerciseRepositoryImpl(this._service);

  @override
  Future<void> addExercise(String sessionId, ExerciseModel exercise) {
    return _service.addExercise(sessionId, exercise);
  }

  @override
  Future<void> updateExercise(String sessionId, ExerciseModel exercise) {
    return _service.updateExercise(sessionId, exercise);
  }

  @override
  Future<void> deleteExercise(String sessionId, String exerciseId) {
    return _service.deleteExercise(sessionId, exerciseId);
  }

  @override
  Future<List<ExerciseModel>> getExercises(String sessionId) {
    return _service.getExercises(sessionId);
  }
}
