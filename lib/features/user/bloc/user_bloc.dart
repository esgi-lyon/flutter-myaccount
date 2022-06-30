import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:myaccount/features/user/validations/email.dart';
import 'package:myaccount/commons/validations/simple_string.dart';
import 'package:myaccount/features/user/validations/password.dart';
import 'package:user_repository/user_repository.dart';
import 'package:myaccount/commons/extensions/string.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const UserState()) {
    on<UserEmailChanged>(_onEmailChanged);
    on<UserPasswordChanged>(_onPasswordChanged);
    on<UserUpdateSubmitted>(_onUpdate);
    on<UserRegistrationSubmitted>(_onRegister);
  }

  final UserRepository _userRepository;

  void _onEmailChanged(
    UserEmailChanged event,
    Emitter<UserState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([state.password, email]),
    ));
  }

  void _onPasswordChanged(
    UserPasswordChanged event,
    Emitter<UserState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.email]),
    ));
  }

  void _onRegister(
    UserRegistrationSubmitted event,
    Emitter<UserState> emit,
  ) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _userRepository.update(state.toFullDto());
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
