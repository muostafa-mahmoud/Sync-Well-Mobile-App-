// lib/core/app/di.dart
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'package:syncwell/features/auth/data/auth_repository.dart';
import 'package:syncwell/features/auth/data/repositories/local_auth_service.dart';
import 'package:syncwell/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:syncwell/features/dashboard/persentaion/cupit/dashboard_cubit.dart';

import 'package:syncwell/features/diet/data/diet_repository.dart';
import 'package:syncwell/features/diet/presentaion/cubit/diet_cubit.dart';
import 'package:syncwell/features/diet/services.dart';
import 'package:syncwell/features/diet/domain/models/diet_day_model.dart';
import 'package:syncwell/features/profile/peresentation/cubit/profile_cubit.dart';

import 'package:syncwell/features/workout/data/workout_repository.dart';

import 'package:syncwell/features/profile/data/profile_repository.dart';

import 'package:syncwell/features/workout/presentation/cupit/workout_cubit.dart';

import '../dp/boxes.dart';

final getIt = GetIt.instance;

void setupDI() {
  // Repositories / Services
  getIt.registerLazySingleton<LocalAuthService>(() => LocalAuthService());
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<LocalAuthService>()),
  );
  getIt.registerLazySingleton<DioServices>(() => DioServices());
  getIt.registerLazySingleton<DietRepository>(
    () => DietRepository(getIt<DioServices>()),
  );
  getIt.registerLazySingleton<WorkoutRepository>(() => WorkoutRepository());
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(getIt<AuthRepository>()),
  );

  // Cubits (use registerFactory so UI gets a fresh instance)
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(authService: getIt<LocalAuthService>()),
  );
  getIt.registerFactory<DietCubit>(
    () => DietCubit(
      dioServices: getIt<DioServices>(),
      mealsBox: Hive.box<MealsModel>(Boxes.dietBox),
    ),
  );
  getIt.registerFactory<WorkoutCubit>(
    () => WorkoutCubit(getIt<WorkoutRepository>()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(getIt<ProfileRepository>()),
  );
  getIt.registerFactory<DashboardCubit>(
    () => DashboardCubit(
      getIt<AuthRepository>(),
      getIt<DietRepository>(),
      getIt<WorkoutRepository>(),
    ),
  );
}
