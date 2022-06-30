import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaccount/app/back_app_bar.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';
import 'package:myaccount/features/user/view/user_form.dart';
import 'package:myaccount/features/user/view/user_form_configs.dart';
import 'package:user_repository/user_repository.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppTheme.of(context).primaryBackground,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: BackAppBar(pageTitle: 'login.password.forgotten'.tr())),
        body: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Text(
                      'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
                      style: AppTheme.of(context).bodyText2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(12),
              child: BlocProvider(
                create: (context) {
                  return UserBloc(
                    bypassEmpty: UserFormConfigs.forgotAllSkipEmpty,
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  );
                },
                child: Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width - size.width * .90),
                    alignment: Alignment.center,
                    child: UserForm(inputs: UserFormConfigs.forgotInputs)),
              )),
        ])));
  }
}
