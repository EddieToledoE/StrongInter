import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/exercise_model.dart';
import '../../domain/repositories/exercise_repository.dart';

class ExerciseCubit extends Cubit<List<ExerciseModel>> {
  final ExerciseRepository repository;
  final String sessionId;

  ExerciseCubit({required this.repository, required this.sessionId})
    : super([]);

  Future<void> loadExercises() async {
    final exercises = await repository.getExercises(sessionId);
    emit(exercises);
  }

  Future<void> addExercise(ExerciseModel exercise) async {
    await repository.addExercise(sessionId, exercise);
    await loadExercises();
  }

  Future<void> updateExercise(ExerciseModel exercise) async {
    await repository.updateExercise(sessionId, exercise);
    await loadExercises();
  }

  Future<void> deleteExercise(String exerciseId) async {
    await repository.deleteExercise(sessionId, exerciseId);
    await loadExercises();
  }
}
