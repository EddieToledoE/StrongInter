import '../entities/session_model.dart';

abstract class SessionRepository {
  Future<void> addSession(SessionModel session);
  Future<void> updateSession(SessionModel session);
  Future<void> deleteSession(String sessionId);
  Future<List<SessionModel>> getSessions(String userId);
}
