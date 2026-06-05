import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'theme/app_theme.dart';
import 'router/app_router.dart';
import 'services/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.instance.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fresh Grocee - Groceries delivered fast across Kenya',
      theme: AppTheme.theme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 320, end: 480, name: MOBILE),
          const Breakpoint(start: 481, end: 768, name: TABLET),
          const Breakpoint(start: 769, end: 1200, name: DESKTOP),
        ],
      ),
    );
  }
}
