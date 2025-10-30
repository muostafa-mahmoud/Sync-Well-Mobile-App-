// lib/features/auth/data/auth_repository.dart
// Compatibility wrapper that bridges old and new auth implementations
import 'package:hive/hive.dart';
import '../domain/user_mode.dart';

class AuthRepository {
  final String _boxName = 'userBox';

  Box<UserModel> get _box => Hive.box<UserModel>(_boxName);

  UserModel? get currentUser {
    if (_box.isEmpty) return null;
    return _box.values.first;
  }

  void saveUser(UserModel user) {
    _box.clear();
    _box.add(user);
  }

  void updateUser(UserModel user) {
    saveUser(user);
  }

  void deleteUser() {
    _box.clear();
  }

  Future<void> logout() async {
    _box.clear();
  }
}
