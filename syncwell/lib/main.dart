import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'core/app/theme.dart';
import 'core/app/di.dart';
import 'core/dp/hive_init.dart';
import 'core/local/models/user_hive_model.dart';
import 'features/auth/presentation/pages/auth_check_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Get application support directory for Hive (works better on all platforms)
    final appSupportDirectory = await getApplicationSupportDirectory();
    print('Initializing Hive at: ${appSupportDirectory.path}');

    // Initialize Hive with the directory
    Hive.init(appSupportDirectory.path);
  } catch (e) {
    print('Error initializing Hive path: $e');
    // Fallback to default Flutter initialization
    await Hive.initFlutter();
  }

  // Register Hive adapters
  Hive.registerAdapter(UserHiveModelAdapter());

  // Open boxes
  await Hive.openBox<UserHiveModel>('users');
  await Hive.openBox('current_user');

  // Initialize other Hive adapters and boxes
  await initHiveAdaptersAndBoxes();

  // Setup dependency injection
  setupDI();

  runApp(const SyncWellApp());
}

class SyncWellApp extends StatelessWidget {
  const SyncWellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SyncWell',
          theme: buildTheme(),
          home: const AuthCheckScreen(),
        );
      },
    );
  }
}
