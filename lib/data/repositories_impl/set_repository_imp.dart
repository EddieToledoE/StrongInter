import '../../domain/entities/set_model.dart';
import '../../domain/repositories/set_repository.dart';
import '../services/set_service.dart';

class SetRepositoryImpl implements SetRepository {
  final SetService _service;

  SetRepositoryImpl(this._service);

  @override
  Future<void> addSet(String sessionId, String exerciseId, SetModel set) {
    return _service.addSet(sessionId, exerciseId, set);
  }

  @override
  Future<void> updateSet(String sessionId, String exerciseId, SetModel set) {
    return _service.updateSet(sessionId, exerciseId, set);
  }

  @override
  Future<void> deleteSet(String sessionId, String exerciseId, String setId) {
    return _service.deleteSet(sessionId, exerciseId, setId);
  }

  @override
  Future<List<SetModel>> getSets(String sessionId, String exerciseId) {
    return _service.getSets(sessionId, exerciseId);
  }
}
