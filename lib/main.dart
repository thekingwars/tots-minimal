import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:tots_test_app/app/app.bottomsheets.dart';
import 'package:tots_test_app/app/app.dialogs.dart';
import 'package:tots_test_app/app/app.locator.dart';
import 'package:tots_test_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test_app/ui/theme/theme_setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: ThemeSetup.getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp(
          title: 'Minimal',
          debugShowCheckedModeBanner: false,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          initialRoute: Routes.startupView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [
            StackedService.routeObserver,
          ],
        );
      },
    );
  }
}
