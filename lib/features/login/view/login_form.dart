import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/form_message.dart';
import 'package:myaccount/commons/widgets/internal_button.dart';
import 'package:myaccount/commons/widgets/internal_text_field.dart';
import 'package:myaccount/features/login/login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  snackFromState(LoginState state, BuildContext context) {
    if (state.status.isPure && state.status.isValid) return;

    final message = FormMessage(
        status: state.status,
        color: AppTheme.of(context).tertiaryColor,
        validatedProperties: state.props);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(message.getSnackBar(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        snackFromState(state, context);
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _UsernameInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _PasswordInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _PasswordSaveCheckbox(),
          const Padding(padding: EdgeInsets.all(12)),
          _LoginButton(),
        ]),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return InternalTextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          hintText: 'login.hint'.tr(),
          labelText: 'login.email'.tr(),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return InternalTextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          labelText: 'login.password.value'.tr(),
          hintText: 'login.password.hint'.tr(),
        );
      },
    );
  }
}

class _PasswordSaveCheckbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.passwordSave != current.passwordSave,
      builder: (context, state) {
        return CheckboxListTile(
          value: state.passwordSave.value,
          key: const Key('loginForm_passwordSave_checkbox'),
          onChanged: (v) => context
              .read<LoginBloc>()
              .add(LoginPasswordSaveChanged(v ?? false)),
          title: const Text("login.password.remember").tr(),
          activeColor: AppTheme.of(context).secondaryColor,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : InternalButtonWidget(
                text: 'login.connect'.tr(),
                key: const Key('loginForm_continue_raisedButton'),
                options: InternalButtonOptions.of(context),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : () {},
              );
      },
    );
  }
}
