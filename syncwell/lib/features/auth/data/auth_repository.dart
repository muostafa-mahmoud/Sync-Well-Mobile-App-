// lib/features/auth/data/auth_repository.dart
import 'package:hive/hive.dart';
import 'package:syncwell/core/dp/boxes.dart';
import 'package:syncwell/features/auth/domain/user_mode.dart';

class AuthRepository {
  final Box<UserModel> _box = Hive.box<UserModel>(Boxes.userBox);

  UserModel? get currentUser => _box.isEmpty ? null : _box.getAt(0);

  Future<void> saveUser(UserModel user) async {
    if (_box.isEmpty) {
      await _box.add(user);
    } else {
      await _box.putAt(0, user);
    }
  }

  Future<void> logout() async => _box.clear();
}
