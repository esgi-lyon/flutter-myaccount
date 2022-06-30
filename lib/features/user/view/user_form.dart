import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/form_message.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key, required this.inputs}) : super(key: key);

  final List<Widget> inputs;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: _snackFromState,
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(mainAxisSize: MainAxisSize.min, children: inputs),
      ),
    );
  }

  void _snackFromState(BuildContext context, UserState state) {
    if (state.status.isPure && state.status.isValid) return;

    final message = FormMessage(
        status: state.status,
        color: AppTheme.of(context).tertiaryColor,
        validatedProperties: state.props);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(message.getSnackBar(context));
    });
  }
}
