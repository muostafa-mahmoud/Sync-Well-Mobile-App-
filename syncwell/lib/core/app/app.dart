import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'theme.dart';
import 'router.dart';

class SyncWellApp extends StatelessWidget {
  const SyncWellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (_, __) => MaterialApp(
        title: 'SyncWell',
        theme: buildTheme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: Routes.splash,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
