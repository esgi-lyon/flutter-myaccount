import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaccount/app/simple_app_bar.dart';
import 'package:myaccount/commons/constants/routes.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';
import 'package:myaccount/features/user/view/user_form.dart';
import 'package:myaccount/features/user/view/user_form_configs.dart';
import 'package:user_repository/user_repository.dart';
import 'package:formz/formz.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppTheme.of(context).primaryBackground,
        appBar: SimpleAppBar('register.value'.tr(), backButton: true),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: BlocProvider(
                create: (context) {
                  return UserBloc(
                    bypassEmpty: UserFormConfigs.registrationSkipEmpty,
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  );
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.all(size.width - size.width * .90),
                  alignment: Alignment.center,
                  child: BlocListener<UserBloc, UserState>(
                      listener: _onSuccess,
                      child:
                          UserForm(inputs: UserFormConfigs.registrationinputs)),
                ),
              )),
        ));
  }

  _onSuccess(BuildContext context, UserState state) async {
    if (!state.status.isSubmissionSuccess) return;

    await Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (r) => false);
  }
}
