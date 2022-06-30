import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/commons/widgets/complex_button.dart';
import 'package:myaccount/commons/widgets/complex_text_field.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return ComplexTextField(
          onChanged: (v) => context.read<UserBloc>().add(UserEmailChanged(v)),
          hintText: 'login.hint'.tr(),
          labelText: 'login.email'.tr(),
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return ComplexTextField(
          key: const Key('loginForm_passwordInput_textField'),
          obscureText: true,
          onChanged: (password) =>
              context.read<UserBloc>().add(UserPasswordChanged(password)),
          labelText: 'login.password.value'.tr(),
          hintText: 'login.password.hint'.tr(),
        );
      },
    );
  }
}

class ConfirmationPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return ComplexTextField(
          obscureText: true,
          onChanged: (v) =>
              context.read<UserBloc>().add(UserConfirmationPasswordChanged(v)),
          labelText: 'login.password_confirmation.value'.tr(),
          hintText: 'login.password_confirmation.hint'.tr(),
        );
      },
    );
  }
}

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return ComplexTextField(
          onChanged: (v) => context.read<UserBloc>().add(UserNameChanged(v)),
          labelText: 'user.name.value'.tr(),
          hintText: 'user.name.hint'.tr(),
        );
      },
    );
  }
}

class FamilyNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return ComplexTextField(
          onChanged: (familyName) =>
              context.read<UserBloc>().add(UserFamilyNameChanged(familyName)),
          labelText: 'user.family_name.value'.tr(),
          hintText: 'user.family_name.hint'.tr(),
        );
      },
    );
  }
}

class BirthDateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        buildWhen: (previous, current) => previous.name != current.name,
        builder: (context, state) {
          return DateTimeField(
            mode: DateTimeFieldPickerMode.date,
            onDateSelected: (DateTime value) {
              context
                  .read<UserBloc>()
                  .add(UserBirthdateChanged(value.toIso8601String()));
            },
            selectedDate:
                DateTime.tryParse(state.birthdate.value) ?? DateTime.now(),
          );
        });
  }
}

class GenderInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return ComplexTextField(
          onChanged: (v) =>
              context.read<UserBloc>().add(UserFamilyNameChanged(v)),
          labelText: 'user.gender.value'.tr(),
          hintText: 'user.gender.hint'.tr(),
        );
      },
    );
  }
}

class PictureInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return ComplexTextField(
          onChanged: (v) => context.read<UserBloc>().add(UserPictureChanged(v)),
          labelText: 'user.picture.value'.tr(),
          hintText: 'user.picture.hint'.tr(),
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : InternalButtonWidget(
                text: 'user.submit'.tr(),
                key: const Key('userUpdateForm_continue_raisedButton'),
                options: ComplexButtonOptions.of(context),
                onPressed: state.status.isValidated
                    ? () {
                        context
                            .read<UserBloc>()
                            .add(const UserUpdateSubmitted());
                      }
                    : () {},
              );
      },
    );
  }
}
