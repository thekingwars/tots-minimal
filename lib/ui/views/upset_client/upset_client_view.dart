import 'dart:io';
import 'package:tots_test_app/core/validators/upset_client_validators.dart';
import 'package:tots_test_app/ui/common/ui_helpers.dart';

import 'upset_client_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tots_test_app/core/models/client.dart';
import 'package:tots_test_app/ui/common/app_colors.dart';
import 'package:tots_test_app/ui/views/upset_client/upset_client_view.form.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'firstname',
      validator: UpsetClientValidators.validateName,
    ),
    FormTextField(
      name: 'lastname',
      validator: UpsetClientValidators.validateLastName,
    ),
    FormTextField(
      name: 'email',
      validator: UpsetClientValidators.validateEmail,
    ),
  ],
)
class UpsetClientView extends StackedView<UpsetClientViewModel>
    with $UpsetClientView {
  final Client? client;

  const UpsetClientView({Key? key, this.client}) : super(key: key);

  @override
  void onViewModelReady(UpsetClientViewModel viewModel) {
    syncFormWithViewModel(viewModel);

    if (client != null) {
      viewModel.patchForm(client!);
    }
  }

  @override
  void onDispose(UpsetClientViewModel viewModel) {
    super.onDispose(viewModel);

    disposeForm();
  }

  @override
  @override
  Widget builder(
    BuildContext context,
    UpsetClientViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(client != null ? 'Edit Client' : 'Add new Client'),
        surfaceTintColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scrollbar(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    color: const Color(0xFFFDFDF9),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => viewModel.selectImage(),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFE4F353),
                                      // Ajusta el color según la imagen
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: viewModel.selectedImage == null,
                                  replacement: ClipOval(
                                    child: Image.file(
                                      File(viewModel.selectedImage?.path ?? ''),
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/fi-rr-mode-landscape.png',
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'Upload image',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: kcLightGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: firstnameController,
                            decoration: const InputDecoration(
                              labelText: 'Nombre',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          if (viewModel.hasFirstnameValidationMessage) ...[
                            verticalSpaceTiny,
                            Text(
                              viewModel.firstnameValidationMessage!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: lastnameController,
                            decoration: const InputDecoration(
                              labelText: 'Apellido',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          if (viewModel.hasLastnameValidationMessage) ...[
                            verticalSpaceTiny,
                            Text(
                              viewModel.lastnameValidationMessage!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Correo electrónico',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          if (viewModel.hasEmailValidationMessage) ...[
                            verticalSpaceTiny,
                            Text(
                              viewModel.emailValidationMessage!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      const Size(double.infinity, 40),
                    ),
                  ),
                  onPressed: () {
                    viewModel.cancel();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: kcLightGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      const Size(double.infinity, 40),
                    ),
                  ),
                  onPressed: () async {
                    if (client != null) {
                      await viewModel.editClient(client!);
                    } else {
                      await viewModel.createClient();
                    }
                  },
                  child: const Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  UpsetClientViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UpsetClientViewModel();
}
