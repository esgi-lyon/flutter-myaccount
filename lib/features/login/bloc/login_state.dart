part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.status = FormzStatus.pure,
      this.username = const Username.pure(),
      this.password = const Password.pure(),
      this.passwordSave = false});

  final FormzStatus status;
  final Username username;
  final Password password;
  final bool passwordSave;

  LoginState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    bool? passwordSave,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      passwordSave: passwordSave ?? this.passwordSave,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
