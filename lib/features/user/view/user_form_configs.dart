import 'package:flutter/material.dart';
import 'package:myaccount/features/user/view/user_fields.dart';

class UserFormConfigs {
  static const updateAllSkipEmpty = true;

  static final updateInputs = [
    EmailInput(),
    const Padding(padding: EdgeInsets.all(12)),
    NameInput(),
    const Padding(padding: EdgeInsets.all(12)),
    FamilyNameInput(),
    const Padding(padding: EdgeInsets.all(12)),
    GenderInput(),
    const Padding(padding: EdgeInsets.all(12)),
    BirthDateInput(),
    const Padding(padding: EdgeInsets.all(12)),
    PictureInput(),
    const Padding(padding: EdgeInsets.all(12)),
    ConfirmationPasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    PasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    SubmitButton(),
  ];

  static const registrationSkipEmpty = false;

  static final registrationinputs = [
    EmailInput(),
    const Padding(padding: EdgeInsets.all(12)),
    NameInput(),
    const Padding(padding: EdgeInsets.all(12)),
    FamilyNameInput(),
    const Padding(padding: EdgeInsets.all(12)),
    GenderInput(),
    const Padding(padding: EdgeInsets.all(12)),
    BirthDateInput(),
    const Padding(padding: EdgeInsets.all(12)),
    ConfirmationPasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    PasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    SubmitButton(),
  ];

  static const forgotAllSkipEmpty = false;
  static final forgotInputs = [
    const Padding(padding: EdgeInsets.all(12)),
    EmailInput(),
    const Padding(padding: EdgeInsets.all(12)),
    PasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    ConfirmationPasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    SubmitButton(),
  ];
}
