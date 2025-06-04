import '../entities/set_model.dart';

abstract class SetRepository {
  Future<void> addSet(String sessionId, String exerciseId, SetModel set);
  Future<List<SetModel>> getSets(String sessionId, String exerciseId);
  Future<void> deleteSet(String sessionId, String exerciseId, String setId);
  Future<void> updateSet(String sessionId, String exerciseId, SetModel set);
}
