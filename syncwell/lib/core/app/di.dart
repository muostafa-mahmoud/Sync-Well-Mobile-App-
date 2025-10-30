// lib/core/app/di.dart
import 'package:get_it/get_it.dart';
import 'package:syncwell/features/dashboard/persentaion/cupit/dashboard_cubit.dart';
import 'package:syncwell/features/diet/presentaion/cubit/diet_cubit.dart';
import 'package:syncwell/features/profile/data/profile_repository.dart';
import 'package:syncwell/features/profile/peresentation/cubit/profile_cubit.dart';
import 'package:syncwell/features/workout/presentation/cupit/workout_cubit.dart';
import '../../features/auth/data/auth_repository.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/diet/data/diet_api_service.dart';
import '../../features/diet/data/diet_repository.dart';
import '../../features/workout/data/workout_repository.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Services
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<DietApiService>(() => DietApiService('https://api.example.com'));
  getIt.registerLazySingleton<DietRepository>(() => DietRepository(getIt<DietApiService>()));
  getIt.registerLazySingleton<WorkoutRepository>(() => WorkoutRepository());

  // Cubits
  getIt.registerFactory(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory(() => DietCubit(getIt<DietRepository>()));
  getIt.registerFactory(() => WorkoutCubit(getIt<WorkoutRepository>()));
  getIt.registerFactory(() => ProfileCubit(ProfileRepository(getIt<AuthRepository>())));
  getIt.registerFactory(() => DashboardCubit(getIt<AuthRepository>(), getIt<DietRepository>(), getIt<WorkoutRepository>()));
}
