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
        return SimpleTextField(
          onChanged: (v) => context.read<UserBloc>().add(UserEmailChanged(v)),
          hintText: 'login.hint'.tr(),
          labelText: 'login.email'.tr(),
          errorText: state.email.pure ? null : state.email.error?.toString(),
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
        return SimpleTextField(
          key: const Key('loginForm_passwordInput_textField'),
          obscureText: true,
          onChanged: (password) =>
              context.read<UserBloc>().add(UserPasswordChanged(password)),
          labelText: 'login.password.value'.tr(),
          hintText: 'login.password.hint'.tr(),
          errorText:
              state.password.pure ? null : state.password.error?.toString(),
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
        return SimpleTextField(
          obscureText: true,
          onChanged: (v) =>
              context.read<UserBloc>().add(UserConfirmationPasswordChanged(v)),
          labelText: 'login.password_confirmation.value'.tr(),
          hintText: 'login.password_confirmation.hint'.tr(),
          errorText: state.confirmationPassword.pure
              ? null
              : state.confirmationPassword.error?.toString(),
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
        return SimpleTextField(
          onChanged: (v) => context.read<UserBloc>().add(UserNameChanged(v)),
          labelText: 'user.name.value'.tr(),
          hintText: 'user.name.hint'.tr(),
          errorText: state.name.pure ? null : state.name.error?.toString(),
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
        return SimpleTextField(
          onChanged: (familyName) =>
              context.read<UserBloc>().add(UserFamilyNameChanged(familyName)),
          labelText: 'user.family_name.value'.tr(),
          hintText: 'user.family_name.hint'.tr(),
          errorText:
              state.familyName.pure ? null : state.familyName.error?.toString(),
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
        return SimpleTextField(
          onChanged: (v) =>
              context.read<UserBloc>().add(UserFamilyNameChanged(v)),
          labelText: 'user.gender.value'.tr(),
          hintText: 'user.gender.hint'.tr(),
          errorText: state.gender.pure ? null : state.gender.error?.toString(),
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
        return SimpleTextField(
          onChanged: (v) => context.read<UserBloc>().add(UserPictureChanged(v)),
          labelText: 'user.picture.value'.tr(),
          hintText: 'user.picture.hint'.tr(),
          errorText:
              state.picture.pure ? null : state.picture.error?.toString(),
        );
      },
    );
  }
}

class SubmitButton<T extends UserEvent> extends StatelessWidget {
  const SubmitButton({Key? key, required this.event}) : super(key: key);

  final T event;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : InternalButtonWidget(
                text: 'user.submit'.tr(),
                key: key,
                options: ComplexButtonOptions.of(context),
                onPressed: () {
                  context.read<UserBloc>().add(event);
                });
      },
    );
  }
}
