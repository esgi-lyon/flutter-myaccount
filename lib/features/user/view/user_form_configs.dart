import 'package:flutter/material.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';
import 'package:myaccount/features/user/view/user_fields.dart';

class UserFormConfigs {
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
    const SubmitButton(event: UserUpdateSubmitted()),
  ];

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
    const SubmitButton(event: UserRegistrationSubmitted()),
  ];

  static final forgotInputs = [
    const Padding(padding: EdgeInsets.all(12)),
    EmailInput(),
    const Padding(padding: EdgeInsets.all(12)),
    PasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    ConfirmationPasswordInput(),
    const Padding(padding: EdgeInsets.all(12)),
    const SubmitButton(event: UserUpdateSubmitted()),
  ];
}
