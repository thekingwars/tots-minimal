import 'package:stacked/stacked.dart';
import 'package:tots_test_app/app/app.locator.dart';
import 'package:tots_test_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test_app/core/services/authentication_service.dart';
import 'package:tots_test_app/core/services/shared_preference_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final _sharedPreferenceService = locator<SharedPreferenceService>();

  Future runStartupLogic() async {
    await _sharedPreferenceService.init();

    if (_authenticationService.userLoggedIn()) {
      _navigationService.replaceWith(Routes.homeView);
    } else {
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
