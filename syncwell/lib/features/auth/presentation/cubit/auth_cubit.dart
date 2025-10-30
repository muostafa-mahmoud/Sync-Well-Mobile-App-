// lib/features/auth/presentation/cubit/auth_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncwell/features/auth/domain/user_mode.dart';
import '../../data/auth_repository.dart';


class AuthState extends Equatable {
  final bool loading;
  final UserModel? user;
  final String? error;
  const AuthState({this.loading = false, this.user, this.error});
  AuthState copyWith({bool? loading, UserModel? user, String? error}) =>
      AuthState(loading: loading ?? this.loading, user: user ?? this.user, error: error);
  @override
  List<Object?> get props => [loading, user, error];
}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repo;
  AuthCubit(this.repo) : super(const AuthState());

  void checkSession() => emit(AuthState(user: repo.currentUser));

  Future<void> login(String email, String password) async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(milliseconds: 400));
    final demo = UserModel(
      name: "John Doe",
      email: email,
      age: 30,
      weight: 80,
      height: 180,
      bmi: 24.7,
      workoutsCount: 120,
      weightLost: 4.5,
      caloriesPerDay: 1600,
    );
    await repo.saveUser(demo);
    emit(AuthState(loading: false, user: demo));
  }

  Future<void> signup(UserModel user) async {
    emit(state.copyWith(loading: true));
    await repo.saveUser(user);
    emit(AuthState(loading: false, user: user));
  }

  Future<void> logout() async {
    await repo.logout();
    emit(const AuthState());
  }
}
