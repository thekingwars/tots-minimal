import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tots_test_app/core/models/client.dart';
import 'package:tots_test_app/core/shared/enums/client_options.dart';
import 'package:tots_test_app/ui/common/app_colors.dart';
import 'package:tots_test_app/ui/views/home/home_viewmodel.dart';

class ClientsCard extends StatelessWidget {
  final Client client;
  final HomeViewModel viewModel;
  final bool isFromSearch;

  const ClientsCard({
    super.key,
    required this.client,
    required this.viewModel,
    this.isFromSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(color: kcDarkGreyColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Visibility(
              visible: client.photo != null && client.photo!.isNotEmpty,
              replacement: CircleAvatar(
                child: Text(
                  client.firstname[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: CircleAvatar(
                backgroundImage: FileImage(
                  File(client.photo!),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    client.firstname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    client.email,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              splashRadius: 10,
              color: kcDarkGreyColor,
              onSelected: (String value) {
                if (value == ClientOption.edit.name) {
                  viewModel.navigateToUpsetClientView(client);
                }

                if (value == ClientOption.delete.name) {
                  viewModel.deleteClient(client, isFromSearch);
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: ClientOption.edit.name,
                    child: const Row(
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(width: 8.0),
                        Text(
                          'Edit',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: ClientOption.delete.name,
                    child: const Row(
                      children: [
                        Icon(Icons.delete, color: Colors.white),
                        SizedBox(width: 8.0),
                        Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}
