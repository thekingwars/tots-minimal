import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tots_test_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test_app/core/services/authentication_service.dart';
import 'package:tots_test_app/core/services/shared_preference_service.dart';
import 'package:tots_test_app/core/services/client_service.dart';

import 'package:tots_test_app/core/services/client_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthenticationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SharedPreferenceService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ClientService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ClientService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ClientService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ClientService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ClientService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAuthenticationService();
  getAndRegisterSharedPreferenceService();
  getAndRegisterClientService();
  getAndRegisterClientService();
  getAndRegisterClientService();
  getAndRegisterAythenticationService();
  getAndRegisterClientService();
  getAndRegisterClientService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAuthenticationService getAndRegisterAuthenticationService() {
  _removeRegistrationIfExists<AuthenticationService>();
  final service = MockAuthenticationService();
  locator.registerSingleton<AuthenticationService>(service);
  return service;
}

MockSharedPreferenceService getAndRegisterSharedPreferenceService() {
  _removeRegistrationIfExists<SharedPreferenceService>();
  final service = MockSharedPreferenceService();
  locator.registerSingleton<SharedPreferenceService>(service);
  return service;
}

MockClientService getAndRegisterClientService() {
  _removeRegistrationIfExists<ClientService>();
  final service = MockClientService();
  locator.registerSingleton<ClientService>(service);
  return service;
}

MockClientService getAndRegisterClientService() {
  _removeRegistrationIfExists<ClientService>();
  final service = MockClientService();
  locator.registerSingleton<ClientService>(service);
  return service;
}

MockClientService getAndRegisterClientService() {
  _removeRegistrationIfExists<ClientService>();
  final service = MockClientService();
  locator.registerSingleton<ClientService>(service);
  return service;
}

MockAythenticationService getAndRegisterAythenticationService() {
  _removeRegistrationIfExists<AythenticationService>();
  final service = MockAythenticationService();
  locator.registerSingleton<AythenticationService>(service);
  return service;
}

MockClientService getAndRegisterClientService() {
  _removeRegistrationIfExists<ClientService>();
  final service = MockClientService();
  locator.registerSingleton<ClientService>(service);
  return service;
}

MockClientService getAndRegisterClientService() {
  _removeRegistrationIfExists<ClientService>();
  final service = MockClientService();
  locator.registerSingleton<ClientService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
