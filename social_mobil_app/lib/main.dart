import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_mobil_app/core/init/theme/app_theme_light.dart';
import 'package:social_mobil_app/core/navigation/navigation_route.dart';
import 'package:social_mobil_app/core/navigation/navigation_service.dart';
import 'package:social_mobil_app/feature/view/onboard%20board/view/on_board_view.dart';
void main() {
  runApp(
    const ProviderScope(child: MyApp()),
    //)
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //theme: ref.watch(themesProvider.notifier).currentTheme,
      theme: AppThemeLight.instance!.theme,
      home: const OnBoardView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
