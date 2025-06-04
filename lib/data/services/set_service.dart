import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/set_model.dart';

class SetService {
  CollectionReference<Map<String, dynamic>> _setRef(
    String sessionId,
    String exerciseId,
  ) {
    return FirebaseFirestore.instance
        .collection('sessions')
        .doc(sessionId)
        .collection('exercises')
        .doc(exerciseId)
        .collection('sets');
  }

  Future<void> addSet(String sessionId, String exerciseId, SetModel set) async {
    await _setRef(sessionId, exerciseId).doc(set.id).set(set.toMap());
  }

  Future<List<SetModel>> getSets(String sessionId, String exerciseId) async {
    final query = await _setRef(sessionId, exerciseId).get();
    return query.docs
        .map((doc) => SetModel.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> deleteSet(
    String sessionId,
    String exerciseId,
    String setId,
  ) async {
    await _setRef(sessionId, exerciseId).doc(setId).delete();
  }

  Future<void> updateSet(
    String sessionId,
    String exerciseId,
    SetModel set,
  ) async {
    await _setRef(sessionId, exerciseId).doc(set.id).update(set.toMap());
  }
}
