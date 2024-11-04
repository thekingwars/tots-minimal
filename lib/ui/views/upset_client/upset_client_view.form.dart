// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test_app/core/validators/upset_client_validators.dart';

const bool _autoTextFieldValidation = true;

const String FirstnameValueKey = 'firstname';
const String LastnameValueKey = 'lastname';
const String EmailValueKey = 'email';

final Map<String, TextEditingController>
    _UpsetClientViewTextEditingControllers = {};

final Map<String, FocusNode> _UpsetClientViewFocusNodes = {};

final Map<String, String? Function(String?)?> _UpsetClientViewTextValidations =
    {
  FirstnameValueKey: UpsetClientValidators.validateName,
  LastnameValueKey: UpsetClientValidators.validateLastName,
  EmailValueKey: UpsetClientValidators.validateEmail,
};

mixin $UpsetClientView {
  TextEditingController get firstnameController =>
      _getFormTextEditingController(FirstnameValueKey);
  TextEditingController get lastnameController =>
      _getFormTextEditingController(LastnameValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);

  FocusNode get firstnameFocusNode => _getFormFocusNode(FirstnameValueKey);
  FocusNode get lastnameFocusNode => _getFormFocusNode(LastnameValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_UpsetClientViewTextEditingControllers.containsKey(key)) {
      return _UpsetClientViewTextEditingControllers[key]!;
    }

    _UpsetClientViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _UpsetClientViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_UpsetClientViewFocusNodes.containsKey(key)) {
      return _UpsetClientViewFocusNodes[key]!;
    }
    _UpsetClientViewFocusNodes[key] = FocusNode();
    return _UpsetClientViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    firstnameController.addListener(() => _updateFormData(model));
    lastnameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    firstnameController.addListener(() => _updateFormData(model));
    lastnameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FirstnameValueKey: firstnameController.text,
          LastnameValueKey: lastnameController.text,
          EmailValueKey: emailController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _UpsetClientViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _UpsetClientViewFocusNodes.values) {
      focusNode.dispose();
    }

    _UpsetClientViewTextEditingControllers.clear();
    _UpsetClientViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get firstnameValue => this.formValueMap[FirstnameValueKey] as String?;
  String? get lastnameValue => this.formValueMap[LastnameValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;

  set firstnameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstnameValueKey: value}),
    );

    if (_UpsetClientViewTextEditingControllers.containsKey(FirstnameValueKey)) {
      _UpsetClientViewTextEditingControllers[FirstnameValueKey]?.text =
          value ?? '';
    }
  }

  set lastnameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastnameValueKey: value}),
    );

    if (_UpsetClientViewTextEditingControllers.containsKey(LastnameValueKey)) {
      _UpsetClientViewTextEditingControllers[LastnameValueKey]?.text =
          value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_UpsetClientViewTextEditingControllers.containsKey(EmailValueKey)) {
      _UpsetClientViewTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  bool get hasFirstname =>
      this.formValueMap.containsKey(FirstnameValueKey) &&
      (firstnameValue?.isNotEmpty ?? false);
  bool get hasLastname =>
      this.formValueMap.containsKey(LastnameValueKey) &&
      (lastnameValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);

  bool get hasFirstnameValidationMessage =>
      this.fieldsValidationMessages[FirstnameValueKey]?.isNotEmpty ?? false;
  bool get hasLastnameValidationMessage =>
      this.fieldsValidationMessages[LastnameValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;

  String? get firstnameValidationMessage =>
      this.fieldsValidationMessages[FirstnameValueKey];
  String? get lastnameValidationMessage =>
      this.fieldsValidationMessages[LastnameValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
}

extension Methods on FormStateHelper {
  setFirstnameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstnameValueKey] = validationMessage;
  setLastnameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastnameValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstnameValue = '';
    lastnameValue = '';
    emailValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstnameValueKey: getValidationMessage(FirstnameValueKey),
      LastnameValueKey: getValidationMessage(LastnameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _UpsetClientViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _UpsetClientViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FirstnameValueKey: getValidationMessage(FirstnameValueKey),
      LastnameValueKey: getValidationMessage(LastnameValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
    });
