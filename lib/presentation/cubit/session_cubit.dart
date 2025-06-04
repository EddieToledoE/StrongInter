import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/session_model.dart';
import '../../domain/repositories/session_repository.dart';

class SessionCubit extends Cubit<List<SessionModel>> {
  final SessionRepository repository;
  final String userId;

  SessionCubit({required this.repository, required this.userId}) : super([]);

  Future<void> loadSessions() async {
    final sessions = await repository.getSessions(userId);
    emit(sessions);
  }

  Future<void> addSession(SessionModel session) async {
    await repository.addSession(session);
    await loadSessions(); // recarga al agregar
  }

  Future<void> updateSession(SessionModel session) async {
    await repository.updateSession(session);
    await loadSessions();
  }

  Future<void> deleteSession(String sessionId) async {
    await repository.deleteSession(sessionId);
    await loadSessions();
  }
}
