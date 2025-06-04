import '../../domain/entities/user_model.dart';
import '../../domain/repositories/user_repository.dart';
import '../services/user_service.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService _service;

  UserRepositoryImpl(this._service);

  @override
  Future<void> createUser(UserModel user) {
    return _service.createUser(user);
  }

  @override
  Future<UserModel?> getUser(String uid) {
    return _service.getUser(uid);
  }

  @override
  Future<void> updateUser(UserModel user) {
    return _service.updateUser(user);
  }
}
