import 'package:flutter/material.dart';
import 'package:formation_flutter/demo_form.dart';
import 'package:formation_flutter/l10n/app_localizations.dart';
import 'package:formation_flutter/pages/details/product_page.dart';
import 'package:formation_flutter/pages/homepage/home_page.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/res/app_theme.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return DemoForm();
        },
      ),
      GoRoute(
        path: '/product',
        builder: (BuildContext context, GoRouterState state) {
          print(state.uri.queryParameters['paramA']);
          return ProductPage(
            paramA: state.uri.queryParameters['paramA'] ?? '',
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Avenir',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.yellow),
        extensions: [OffThemeExtension.defaultValues()],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          indicatorColor: AppColors.blue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.grey2,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
        ),
        dividerTheme: DividerThemeData(color: AppColors.divider, space: 1.0),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
