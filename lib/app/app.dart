import 'package:stacked_themes/stacked_themes.dart';
import 'package:tots_test_app/core/services/shared_preference_service.dart';
import 'package:tots_test_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tots_test_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tots_test_app/ui/views/home/home_view.dart';
import 'package:tots_test_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test_app/ui/views/login/login_view.dart';
import 'package:tots_test_app/core/services/authentication_service.dart';
import 'package:tots_test_app/ui/dialogs/loader/loader_dialog.dart';
import 'package:tots_test_app/ui/dialogs/error/error_dialog.dart';

import 'package:tots_test_app/core/services/client_service.dart';
import 'package:tots_test_app/ui/views/upset_client/upset_client_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: UpsetClientView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    LazySingleton(classType: SharedPreferenceService),
    LazySingleton(classType: ClientService),
// @stacked-dependency
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: LoaderDialog),
    StackedDialog(classType: ErrorDialog),
// @stacked-dialog
  ],
)
class App {}
