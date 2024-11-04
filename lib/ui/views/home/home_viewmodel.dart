import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test_app/app/app.locator.dart';
import 'package:tots_test_app/app/app.router.dart';
import 'package:tots_test_app/core/models/client.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test_app/core/services/authentication_service.dart';
import 'package:tots_test_app/core/services/client_service.dart';

class HomeViewModel extends BaseViewModel {
  final _clientService = locator<ClientService>();
  final _authenticationService = locator<AuthenticationService>();
  final _navigatorService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  List<Client> _allClients = [];

  List<Client> _clients = [];

  bool loading = false;

  bool get canLoadMore => _allClients.length > _clients.length;

  List<Client> get clients => _clients;

  List<Client> get searchClients => _allClients;

  Future<void> getClients() async {
    setBusy(true);

    _allClients = await _clientService.getClients();

    if (_allClients.length < 5) {
      _clients = _allClients;
      setBusy(false);
      return;
    }

    _clients = _allClients.take(5).toList();

    setBusy(false);
  }

  void loadMoreClient() {
    if (_allClients.length <= _clients.length) {
      return;
    }

    final int nextIndex = _clients.length;
    final int endIndex = (nextIndex + 5).clamp(0, _allClients.length);

    _clients = [
      ..._clients,
      ..._allClients.getRange(nextIndex, endIndex).toList(),
    ];

    rebuildUi();
  }

  void navigateToUpsetClientView([Client? client]) {
    _navigatorService.navigateToUpsetClientView(client: client);
  }

  void deleteClient(Client client, bool isFromSearch) async {
    final DialogResponse? confirm = await _dialogService.showConfirmationDialog(
      title: 'Eliminar cliente',
      description: '¿Estás seguro de eliminar a ${client.firstname}?',
      confirmationTitle: 'Sí',
      cancelTitle: 'No',
    );

    if (confirm!.confirmed && !isFromSearch) {
      await _clientService.deleteClient(client.id!);

      await getClients();
    } else if (confirm.confirmed && isFromSearch) {
      await _clientService.deleteClient(client.id!);

      _allClients.remove(client);
      _clients.remove(client);

      _navigatorService.back();
    } else {
      return;
    }
  }

  void logout() {
    _authenticationService.logout();
  }
}
