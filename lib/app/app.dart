import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaccount/bloc/authentication/authentication.dart';
import 'package:myaccount/commons/constants/routes.dart';
import 'package:myaccount/pages/home.dart';
import 'package:myaccount/pages/landing.dart';
import 'package:myaccount/pages/login.dart';
import 'package:user_repository/user_repository.dart';

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
      navigatorKey: _navigatorKey,
              title: 'My Accoun',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: Routes.landing,
        routes: {
          Routes.login: (context) => const LoginWidget(title: 'Index'),
          Routes.landing: (context) => const LandingPage()
        }
      
      // builder: (context, child) {
      //   return BlocListener<AuthenticationBloc, AuthenticationState>(
      //     listener: (context, state) {
      //       switch (state.status) {
      //         case AuthenticationStatus.authenticated:
      //           _navigator.pushAndRemoveUntil<void>(
      //             HomePage.route(),
      //             (route) => false,
      //           );
      //           break;
      //         case AuthenticationStatus.unauthenticated:
      //           _navigator.pushAndRemoveUntil<void>(
      //             LoginPage.route(),
      //             (route) => false,
      //           );
      //           break;
      //         default:
      //           break;
      //       }
      //     },
      //     child: child,
      //   );
      // },
      // onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
