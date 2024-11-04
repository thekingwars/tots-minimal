import 'dart:convert';

import 'package:tots_test_app/app/app.locator.dart';
import 'package:tots_test_app/core/shared/constants/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:tots_test_app/core/models/client.dart';
import 'package:tots_test_app/core/services/shared_preference_service.dart';

class ClientService {
  final String? _userToken = locator<SharedPreferenceService>().getToken();

  Future<List<Client>> getClients() async {
    final url = Uri.https(BASE_URL, '/6-tots-test/clients');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $_userToken',
    });

    Iterable data = jsonDecode(response.body)['data'];

    switch (response.statusCode) {
      case 400:
        throw 'Error al obtener los clientes';
      case 404:
        throw 'No se encontraron clientes';
      case 500:
        throw 'Error del servidor';
    }

    final List<Client> clients =
        data.map((model) => Client.fromJson(model)).toList();

    final List<Client> sortedClients = clients
      ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    return sortedClients;
  }

  Future<void> createClient(Client client) async {
    final url = Uri.https(BASE_URL, '/6-tots-test/clients');

    final response = await http.post(
      url,
      body: client.toJson(),
      headers: {
        'Authorization': 'Bearer $_userToken',
      },
    );

    switch (response.statusCode) {
      case 400:
        throw 'Error al crear el cliente';
      case 500:
        throw 'Error del servidor';
    }
  }

  Future<void> updateClient(Client client) async {
    final url =
        Uri.https(BASE_URL, '/6-tots-test/clients/${client.id.toString()}');

    final response = await http.put(
      url,
      body: client.toJson(),
      headers: {
        'Authorization': 'Bearer $_userToken',
      },
    );

    switch (response.statusCode) {
      case 400:
        throw 'Error al actualizar el cliente';
      case 500:
        throw 'Error del servidor';
    }
  }

  Future<void> deleteClient(int id) async {
    final url = Uri.https(BASE_URL, '/6-tots-test/clients/$id');

    final response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $_userToken',
      },
    );

    switch (response.statusCode) {
      case 400:
        throw 'Error al eliminar el cliente';
      case 500:
        throw 'Error del servidor';
    }
  }
}
