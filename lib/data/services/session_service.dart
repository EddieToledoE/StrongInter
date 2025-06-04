import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/session_model.dart';

class SessionService {
  final _sessions = FirebaseFirestore.instance.collection('sessions');

  Future<void> addSession(SessionModel session) async {
    await _sessions.doc(session.id).set(session.toMap());
  }

  Future<List<SessionModel>> getSessions(String userId) async {
    final query = await _sessions
        .where('userId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .get();

    return query.docs
        .map((doc) => SessionModel.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> deleteSession(String sessionId) async {
    await _sessions.doc(sessionId).delete();
  }

  Future<void> updateSession(SessionModel session) async {
    await _sessions.doc(session.id).update(session.toMap());
  }
}
