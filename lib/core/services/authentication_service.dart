import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test_app/app/app.locator.dart';
import 'package:tots_test_app/app/app.router.dart';
import 'package:tots_test_app/core/shared/constants/base_url.dart';
import 'package:tots_test_app/core/models/user_logged_in.dart';
import 'package:tots_test_app/core/services/shared_preference_service.dart';

class AuthenticationService {
  final _sharedPreferenceService = locator<SharedPreferenceService>();
  final _navigationService = locator<NavigationService>();

  Future<UserLoggedIn> login(String email, String password) async {
    final url = Uri.https(BASE_URL, '/6-tots-test/oauth/token');

    final response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    switch (response.statusCode) {
      case 400:
        throw 'Email y contraseña son requeridos';
      case 404:
        throw 'Contraseña incorrecta';
      case 500:
        throw 'Llene todo los campos';
    }

    final userLoggedIn = UserLoggedIn.fromJson(data);

    return userLoggedIn;
  }

  bool userLoggedIn() {
    return _sharedPreferenceService.getToken() != null;
  }

  void logout() {
    _sharedPreferenceService.removeToken();

    _navigationService.replaceWith(Routes.loginView);
  }
}
