import 'package:authentication_repository/authentication_repository.dart';
import 'package:myaccount/commons/widgets/loading.dart';
import 'package:myaccount/bloc/authentication/authentication.dart';
import 'package:myaccount/pages/home.dart';
import 'package:myaccount/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) =>
          debugPrint("[LANDING PAGE] Receiving event: $state"),
      builder: (context, state) {
        if (state == AuthenticationStatus.loading)
          return LandingPage();
        else if (state == AuthenticationStatus.authenticated) {
          return Home();
        } else if (state == AuthenticationStatus.unauthenticated)
          return Register();
        else
          return LoadingIndicator();
      },
    );
  }
}
