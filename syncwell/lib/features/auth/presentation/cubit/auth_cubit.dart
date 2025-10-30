import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/local_auth_service.dart';
import '../../data/models/auth_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LocalAuthService _authService;

  AuthCubit({LocalAuthService? authService})
      : _authService = authService ?? LocalAuthService(),
        super(const AuthState());

  void toggleAuthMode() {
    emit(state.copyWith(isLogin: !state.isLogin));
  }

  Future<void> login(LoginRequest request) async {
    emit(state.copyWith(status: AuthStatus.loading, clearError: true));

    try {
      final user = await _authService.login(
        email: request.email,
        password: request.password,
      );

      emit(state.copyWith(
          status: AuthStatus.success, user: user, clearError: true));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
    }
  }

  Future<void> signUp(SignUpRequest request) async {
    emit(state.copyWith(status: AuthStatus.loading, clearError: true));

    try {
      final user = await _authService.signUp(
        email: request.email,
        password: request.password,
        fullName: request.fullName,
        phone: request.phone,
        dob: request.dob,
      );

      emit(state.copyWith(
          status: AuthStatus.success, user: user, clearError: true));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
    }
  }

  void resetError() {
    emit(state.copyWith(status: AuthStatus.initial, clearError: true));
  }

  Future<void> forgotPassword(String email) async {
    emit(state.copyWith(status: AuthStatus.loading, clearError: true));

    try {
      await _authService.sendPasswordResetEmail(email);
      emit(state.copyWith(status: AuthStatus.success, clearError: true));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    emit(const AuthState());
  }

  Future<void> loadCurrentUser() async {
    try {
      final user = await _authService.loadCurrentUserProfile();

      if (user == null) {
        emit(state.copyWith(status: AuthStatus.initial, user: null));
        return;
      }

      emit(state.copyWith(
          status: AuthStatus.success, user: user, clearError: true));
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
    }
  }
}
