import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/session_model.dart';
import '../../domain/repositories/session_repository.dart';
import 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final SessionRepository repository;
  final String userId;

  SessionCubit({required this.repository, required this.userId})
    : super(SessionInitial());

  Future<void> loadSessions() async {
    emit(SessionLoading());
    try {
      final sessions = await repository.getSessions(userId);
      emit(SessionLoaded(sessions));
    } catch (e) {
      emit(SessionError('Error al cargar sesiones: ${e.toString()}'));
    }
  }

  Future<void> addSession(SessionModel session) async {
    try {
      await repository.addSession(session);
      await loadSessions(); // recargar lista
    } catch (e) {
      emit(SessionError('Error al agregar sesión: ${e.toString()}'));
    }
  }

  Future<void> updateSession(SessionModel session) async {
    try {
      await repository.updateSession(session);
      await loadSessions();
    } catch (e) {
      emit(SessionError('Error al actualizar sesión: ${e.toString()}'));
    }
  }

  Future<void> deleteSession(String sessionId) async {
    try {
      await repository.deleteSession(sessionId);
      await loadSessions();
    } catch (e) {
      emit(SessionError('Error al eliminar sesión: ${e.toString()}'));
    }
  }
}
