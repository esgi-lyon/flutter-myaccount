import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaccount/features/authentication/authentication.dart';
import 'package:myaccount/commons/constants/routes.dart';
import 'package:myaccount/pages/home.dart';
import 'package:myaccount/pages/landing.dart';
import 'package:myaccount/pages/login.dart';
import 'package:user_repository/user_repository.dart';
import 'package:hive/hive.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // navigatorKey: _navigatorKey,
        title: 'My Account',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: Routes.landing,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: {
          Routes.login: (context) => const LoginWidget(title: 'Index'),
          Routes.landing: (context) => const LandingPage()
        });
  }
}
