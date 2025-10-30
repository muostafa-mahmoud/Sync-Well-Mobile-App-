// lib/features/profile/data/profile_repository.dart
import 'package:syncwell/features/auth/domain/user_mode.dart';

import '../../auth/data/auth_repository.dart';

class ProfileRepository {
  final AuthRepository authRepository;
  ProfileRepository(this.authRepository);
  UserModel? get profile => authRepository.currentUser;
}
