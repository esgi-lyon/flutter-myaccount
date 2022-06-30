import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/features/user/validations/email.dart';
import 'package:myaccount/commons/validations/validations.dart';
import 'package:myaccount/features/user/validations/password.dart';
import 'package:user_repository/user_repository.dart';
import 'package:myaccount/commons/extensions/string.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository userRepository, this.bypassEmpty})
      : _userRepository = userRepository,
        super(const UserState()) {
    on<UserEmailChanged>(_onEmailChanged);
    on<UserNameChanged>(_onNameChanged);
    on<UserPasswordChanged>(_onPasswordChanged);
    on<UserConfirmationPasswordChanged>(_onConfirmationPasswordChanged);
    on<UserFamilyNameChanged>(_onFamilyNameChanged);
    on<UserPictureChanged>(_onPictureChanged);
    on<UserBirthdateChanged>(_onBirthdateChanged);
    on<UserGenderChanged>(_onGenderChanged);

    on<UserUpdateSubmitted>(_onUpdate);
    on<UserRegistrationSubmitted>(_onRegister);
  }

  final UserRepository _userRepository;

  final bool? bypassEmpty;

  void _onEmailChanged(
    UserEmailChanged event,
    Emitter<UserState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: validateOrSkip([email], bypassEmpty),
    ));
  }

  void _onNameChanged(
    UserNameChanged event,
    Emitter<UserState> emit,
  ) {
    final name = SimpleString.dirty(event.name);
    emit(state.copyWith(
      name: name,
      status: validateOrSkip([name], bypassEmpty),
    ));
  }

  void _onFamilyNameChanged(
    UserFamilyNameChanged event,
    Emitter<UserState> emit,
  ) {
    final familyName = SimpleString.dirty(event.familyName);
    emit(state.copyWith(
      familyName: familyName,
      status: validateOrSkip([familyName], bypassEmpty),
    ));
  }

  void _onPictureChanged(
    UserPictureChanged event,
    Emitter<UserState> emit,
  ) {
    final picture = SimpleString.dirty(event.picture);
    emit(state.copyWith(
      picture: picture,
      status: validateOrSkip([picture], bypassEmpty),
    ));
  }

  void _onBirthdateChanged(
    UserBirthdateChanged event,
    Emitter<UserState> emit,
  ) {
    final birthDate = SimpleString.dirty(event.birthdate);
    emit(state.copyWith(
      birthdate: birthDate,
      status: validateOrSkip([birthDate], bypassEmpty),
    ));
  }

  void _onGenderChanged(
    UserGenderChanged event,
    Emitter<UserState> emit,
  ) {
    final gender = SimpleString.dirty(event.gender);
    emit(state.copyWith(
      gender: gender,
      status: validateOrSkip([gender], bypassEmpty),
    ));
  }

  void _onPasswordChanged(
    UserPasswordChanged event,
    Emitter<UserState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: validateOrSkip([password], bypassEmpty),
    ));
  }

  void _onConfirmationPasswordChanged(
    UserConfirmationPasswordChanged event,
    Emitter<UserState> emit,
  ) {
    final confirmationPassword = Password.dirty(event.passwordConfirmation);
    emit(state.copyWith(
      confirmationPassword: confirmationPassword,
      status: validateOrSkip([confirmationPassword], bypassEmpty),
    ));
  }

  void _onRegister(
    UserRegistrationSubmitted event,
    Emitter<UserState> emit,
  ) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _userRepository.register(state.toFullDto());
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void _onUpdate(
    UserUpdateSubmitted event,
    Emitter<UserState> emit,
  ) async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _userRepository.update(state.toPartialDto());
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
