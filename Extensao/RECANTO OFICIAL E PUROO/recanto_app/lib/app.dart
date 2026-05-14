import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_router.dart';


class RecantoApp extends ConsumerWidget {
  const RecantoApp({Key? key}) : super(key: key);
  

  // alguem tem que ver isso da i
  get goRouterProvider => null;
  get AppTheme => null;
 //


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Recanto dos Velhinhos',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(),
          routerConfig: goRouterProvider,
          locale: const Locale('pt', 'BR'),
          supportedLocales: const [
            Locale('pt', 'BR'),
            Locale('pt', ''),
            Locale('en', ''),
          ],
        );
      },
    );
  }
}