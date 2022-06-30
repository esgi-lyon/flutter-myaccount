import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/features/authentication/authentication.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppTheme.of(context).secondaryColor,
          automaticallyImplyLeading: false,
          title: Text('home', style: AppTheme.of(context).title1).tr(),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        backgroundColor: AppTheme.of(context).primaryBackground,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Builder(
                        builder: (context) {
                          final userId = context.select(
                            (AuthenticationBloc bloc) => bloc.state.user.id,
                          );
                          return Text('UserID: $userId');
                        },
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppTheme.of(context).secondaryColor),
                        child: const Text('logout').tr(),
                        onPressed: () {
                          context
                              .read<AuthenticationBloc>()
                              .add(AuthenticationLogoutRequested());
                        },
                      ),
                    ],
                  )),
                ),
              ),
            ]));
  }
}
