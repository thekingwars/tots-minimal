import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test_app/app/app.dialogs.dart';
import 'package:tots_test_app/app/app.locator.dart';
import 'package:tots_test_app/app/app.router.dart';
import 'package:tots_test_app/core/services/authentication_service.dart';
import 'package:tots_test_app/core/services/shared_preference_service.dart';
import 'package:tots_test_app/ui/views/login/login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final _dialogService = locator<DialogService>();

  final _navigationService = locator<NavigationService>();

  final _sharedPreferenceService = locator<SharedPreferenceService>();

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  Future<void> login() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      title: 'Cargando...',
      barrierDismissible: false,
    );

    try {
      final response = await _authenticationService.login(
        emailValue!,
        passwordValue!,
      );

      _sharedPreferenceService.setToken(response.accessToken);

      _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    } catch (e) {
      _navigationService.back();

      _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Error',
        description: e.toString(),
      );

      rethrow;
    }
  }

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    rebuildUi();
  }
}
