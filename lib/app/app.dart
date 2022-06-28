import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/features/authentication/authentication.dart';
import 'package:myaccount/commons/constants/routes.dart';
import 'package:user_repository/user_repository.dart';
// import 'package:hive/hive.dart';
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

    static _AppViewState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppViewState>()!;
}

class _AppViewState extends State<AppView> {

  final _navigatorKey = GlobalKey<NavigatorState>();
  ThemeMode _themeMode = AppTheme.themeMode;

  NavigatorState get _navigator => _navigatorKey.currentState!;

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        AppTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'app'.tr(),
        initialRoute: Routes.splashScreen,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: _themeMode,
        locale: context.locale,
        routes: Routes.tabs);
  }
}
