// lib/core/app/di.dart
import 'package:get_it/get_it.dart';

import 'package:syncwell/features/auth/data/auth_repository.dart';
import 'package:syncwell/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:syncwell/features/dashboard/persentaion/cupit/dashboard_cubit.dart';

import 'package:syncwell/features/diet/data/diet_api_service.dart';
import 'package:syncwell/features/diet/data/diet_repository.dart';
import 'package:syncwell/features/diet/presentaion/cubit/diet_cubit.dart';
import 'package:syncwell/features/profile/peresentation/cubit/profile_cubit.dart';

import 'package:syncwell/features/workout/data/workout_repository.dart';

import 'package:syncwell/features/profile/data/profile_repository.dart';

import 'package:syncwell/features/workout/presentation/cupit/workout_cubit.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Repositories / Services
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<DietApiService>(() => DietApiService('https://api.example.com'));
  getIt.registerLazySingleton<DietRepository>(() => DietRepository(getIt<DietApiService>()));
  getIt.registerLazySingleton<WorkoutRepository>(() => WorkoutRepository());
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository(getIt<AuthRepository>()));

  // Cubits (use registerFactory so UI gets a fresh instance)
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory<DietCubit>(() => DietCubit(getIt<DietRepository>()));
  getIt.registerFactory<WorkoutCubit>(() => WorkoutCubit(getIt<WorkoutRepository>()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileRepository>() as AuthRepository));
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit(getIt<AuthRepository>(), getIt<DietRepository>(), getIt<WorkoutRepository>()));
}
