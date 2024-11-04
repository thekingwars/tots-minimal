import 'package:flutter/material.dart';
import 'package:tots_test_app/core/models/client.dart';
import 'package:tots_test_app/ui/views/home/home_viewmodel.dart';
import 'package:tots_test_app/ui/widgets/clients_card.dart';

class ClientSearchDelegate extends SearchDelegate<Client?> {
  final HomeViewModel viewModel;

  ClientSearchDelegate(this.viewModel);

  @override
  String? get searchFieldLabel => 'Busque por nombre o email';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        fontSize: 18,
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = viewModel.searchClients.where((client) {
      return client.firstname!.toLowerCase().contains(query.toLowerCase()) ||
          client.email!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final client = results[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ClientsCard(
            client: client,
            viewModel: viewModel,
            isFromSearch: true,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = viewModel.searchClients.where((client) {
      return client.firstname!.toLowerCase().contains(query.toLowerCase()) ||
          client.email!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final client = suggestions[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ClientsCard(
            client: client,
            viewModel: viewModel,
            isFromSearch: true,
          ),
        );
      },
    );
  }
}
