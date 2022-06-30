import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaccount/app/simple_app_bar.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/features/user/bloc/user_bloc.dart';
import 'package:myaccount/features/user/view/user_form.dart';
import 'package:myaccount/features/user/view/user_form_configs.dart';
import 'package:user_repository/user_repository.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppTheme.of(context).primaryBackground,
        appBar: SimpleAppBar('user.profile'.tr()),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: BlocProvider(
                create: (context) {
                  return UserBloc(
                    userRepository:
                        RepositoryProvider.of<UserRepository>(context),
                  );
                },
                child: Container(
                    width: size.width,
                    padding: EdgeInsets.all(size.width - size.width * .90),
                    alignment: Alignment.center,
                    child: UserForm(inputs: UserFormConfigs.updateInputs)),
              )),
        ));
  }
}
