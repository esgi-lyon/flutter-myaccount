import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

extension FormzEquatable on Equatable {
  List<FormzInput> parseInputs() =>
      props.where((e) => e is FormzInput).map((e) => e as FormzInput).toList();
  FormzStatus parseFormStatus() => props
      .where((e) => e is FormzStatus)
      .map((e) => e as FormzStatus)
      .toList()
      .first;
}
