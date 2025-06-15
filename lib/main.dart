import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:online_courses/bloc/auth/auth_bloc.dart';
import 'package:online_courses/bloc/font/font_bloc.dart';
import 'package:online_courses/bloc/font/font_state.dart';
import 'package:online_courses/core/theme/app_theme.dart';
import 'package:online_courses/routes/app_routes.dart';
import 'package:online_courses/routes/route_pages.dart';
import 'package:online_courses/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FontBloc>(create: (context) => FontBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],
      child: BlocBuilder<FontBloc, FontState>(
        builder: (context, fontState) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "E-Learning",
            theme: AppTheme.getLightTheme(fontState),
            themeMode: ThemeMode.light,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            getPages: AppPages.pages,
          );
        },
      ),
    );
  }
}
