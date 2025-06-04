import '../../domain/entities/session_model.dart';
import '../../domain/repositories/session_repository.dart';
import '../services/session_service.dart';

class SessionRepositoryImpl implements SessionRepository {
  final SessionService _service;

  SessionRepositoryImpl(this._service);

  @override
  Future<void> addSession(SessionModel session) {
    return _service.addSession(session);
  }

  @override
  Future<void> updateSession(SessionModel session) {
    return _service.updateSession(session);
  }

  @override
  Future<void> deleteSession(String sessionId) {
    return _service.deleteSession(sessionId);
  }

  @override
  Future<List<SessionModel>> getSessions(String userId) {
    return _service.getSessions(userId);
  }
}
