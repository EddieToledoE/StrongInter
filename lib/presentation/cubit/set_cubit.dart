import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/set_model.dart';
import '../../domain/repositories/set_repository.dart';

class SetCubit extends Cubit<List<SetModel>> {
  final SetRepository repository;
  final String sessionId;
  final String exerciseId;

  SetCubit({
    required this.repository,
    required this.sessionId,
    required this.exerciseId,
  }) : super([]);

  Future<void> loadSets() async {
    final sets = await repository.getSets(sessionId, exerciseId);
    emit(sets);
  }

  Future<void> addSet(SetModel set) async {
    await repository.addSet(sessionId, exerciseId, set);
    await loadSets();
  }

  Future<void> updateSet(SetModel set) async {
    await repository.updateSet(sessionId, exerciseId, set);
    await loadSets();
  }

  Future<void> deleteSet(String setId) async {
    await repository.deleteSet(sessionId, exerciseId, setId);
    await loadSets();
  }
}
