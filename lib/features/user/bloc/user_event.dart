part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserEmailChanged extends UserEvent {
  const UserEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class UserPasswordChanged extends UserEvent {
  const UserPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class UserPasswordConfirmationChanged extends UserEvent {
  const UserPasswordConfirmationChanged(this.passwordConfirmation);

  final bool passwordConfirmation;

  @override
  List<Object> get props => [passwordConfirmation];
}

class UserUpdateSubmitted extends UserEvent {
  const UserUpdateSubmitted();
}

class UserRegistrationSubmitted extends UserEvent {
  const UserRegistrationSubmitted();
}
