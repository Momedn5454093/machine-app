import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(RetenScopeApp(appRouter: AppRouter()));
}

class RetenScopeApp extends StatelessWidget {
  final AppRouter appRouter;

  const RetenScopeApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RetenScope - Churn Prediction',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.loginScreen,
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
