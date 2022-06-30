part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState(
      {this.status = FormzStatus.pure,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmationPassword = const Password.pure(),
      this.name = const SimpleString.pure(),
      this.familyName = const SimpleString.pure(),
      this.picture = const SimpleString.pure(),
      this.gender = const SimpleString.pure(),
      this.birthdate = const SimpleString.pure()});

  final FormzStatus status;
  final Email email;
  final Password password;
  final Password confirmationPassword;
  final SimpleString name;
  final SimpleString familyName;
  final SimpleString picture;
  final SimpleString gender;
  final SimpleString birthdate;

  UserState copyWith({
    FormzStatus? status,
    Email? email,
    Password? password,
    Password? confirmationPassword,
    SimpleString? name,
    SimpleString? familyName,
    SimpleString? picture,
    SimpleString? birthdate,
    SimpleString? gender,
  }) {
    return UserState(
      status: status ?? this.status,
      name: name ?? this.name,
      password: password ?? this.password,
      familyName: familyName ?? this.familyName,
      confirmationPassword: confirmationPassword ?? this.confirmationPassword,
      email: email ?? this.email,
      picture: picture ?? this.picture,
      gender: gender ?? this.gender,
    );
  }

  toPartialDto() => PartialUserDto(
      name.value.toNullIfEmpty(),
      email.value.toNullIfEmpty(),
      familyName.value.toNullIfEmpty(),
      picture.value.toNullIfEmpty(),
      birthdate.value.toNullIfEmpty(),
      gender.value.toNullIfEmpty(),
      password.value.toNullIfEmpty(),
      confirmationPassword.value.toNullIfEmpty());

  toFullDto() => PartialUserDto(
      name.value,
      email.value,
      familyName.value,
      picture.value,
      birthdate.value,
      gender.value,
      password.value,
      confirmationPassword.value);

  @override
  List<Object> get props => [
        status,
        email,
        password,
        confirmationPassword,
        picture,
        gender,
        birthdate
      ];
}
