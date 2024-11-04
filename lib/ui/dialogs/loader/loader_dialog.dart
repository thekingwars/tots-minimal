import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'loader_dialog_model.dart';

class LoaderDialog extends StackedView<LoaderDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const LoaderDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoaderDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              request.title!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoaderDialogModel viewModelBuilder(BuildContext context) =>
      LoaderDialogModel();
}
