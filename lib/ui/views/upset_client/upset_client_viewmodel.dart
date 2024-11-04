import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tots_test_app/app/app.dialogs.dart';
import 'package:tots_test_app/app/app.locator.dart';
import 'package:tots_test_app/app/app.router.dart';
import 'package:tots_test_app/core/models/client.dart';
import 'package:tots_test_app/core/services/client_service.dart';
import 'package:tots_test_app/ui/views/upset_client/upset_client_view.form.dart';

class UpsetClientViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _clientService = locator<ClientService>();
  final _dialogService = locator<DialogService>();

  XFile? _selectedImage;

  XFile? get selectedImage => _selectedImage;

  void patchForm(Client client) {
    final data = client.toJson();

    firstnameValue = client.firstname;
    lastnameValue = client.lastname;
    emailValue = client.email;

    formValueMap = {
      ...data,
      'photo': client.photo,
    };

    if (client.photo != null && client.photo!.isNotEmpty) {
      final file = File(client.photo!);
      if (file.existsSync()) {
        _selectedImage = XFile(client.photo!);
      } else {
        _selectedImage = null;
      }
    } else {
      _selectedImage = null;
    }
  }

  Future<void> createClient() async {
    formValueMap['photo'] = _selectedImage?.path;

    if (!validateForm()) {
      return;
    }

    formValueMap = {
      ...formValueMap,
      'id': 0,
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
      'user_id': 1,
    };

    final client = Client.fromJson(formValueMap);

    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      title: 'Creando cliente...',
    );

    try {
      await _clientService.createClient(client);

      _navigationService.back();

      _dialogService
          .showCustomDialog(
            variant: DialogType.infoAlert,
            title: 'Cliente creado',
            description: 'El cliente ha sido creado correctamente',
          )
          .whenComplete(
            () => _navigationService.pushNamedAndRemoveUntil(Routes.homeView),
          );
    } catch (e) {
      _navigationService.back();

      _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  editClient(Client oldClient) async {
    if (!validateForm()) {
      return;
    }

    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      title: 'Actualizando cliente...',
    );

    formValueMap['photo'] = _selectedImage?.path;

    formValueMap = {
      ...formValueMap,
      'id': oldClient.id,
      'created_at': oldClient.createdAt!.toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
      'user_id': oldClient.userId,
    };

    final client = Client.fromJson(formValueMap);

    try {
      await _clientService.updateClient(client);

      _navigationService.back();

      _dialogService
          .showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Cliente actualizado',
        description: 'El cliente ha sido actualizado correctamente',
      )
          .whenComplete(() {
        _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
      });
    } catch (e) {
      _navigationService.back();

      _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Error',
        description: e.toString(),
      );
    }
  }

  void cancel() {
    _navigationService.back();
  }

  bool validateForm() {
    if (!isFormValid) {
      _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Error',
        description: 'Error en los campos del formulario',
      );

      return isFormValid;
    }

    return isFormValid;
  }

  Future<void> selectImage() async {
    final imagePicker = ImagePicker();

    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _selectedImage = image;

      rebuildUi();
    }
  }
}
