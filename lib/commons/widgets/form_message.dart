import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class FormMessage<T extends FormzStatus> extends StatelessWidget {
  FormMessage(
      {Key? key,
      required this.status,
      required this.color,
      this.submissionErrors,
      this.validationErrors,
      this.height})
      : super(key: key) {
    errors = _formatFormErrors();
  }

  final T status;

  final Color color;

  final List<Object?>? submissionErrors;

  final List<Object?>? validationErrors;

  final double? height;

  late List<String> errors;

  String translateIssue(dynamic? f) => f?.toString().tr() ?? '';

  List<String> filteredErrors(List<dynamic?>? errors) =>
      errors?.where((e) => e != null).map(translateIssue).toList() ?? [];

  List<String> _formatFormErrors() {
    if (status.isSubmissionFailure) {
      return filteredErrors(submissionErrors);
    } else if (status.isInvalid) {
      return filteredErrors(validationErrors);
    } else {
      return [];
    }
  }

  _getListFromErrors(List<String> errors) {
    return ListView.builder(
      itemCount: errors.length,
      itemBuilder: (BuildContext context, int i) {
        return Text(
          errors.elementAt(i),
          textAlign: TextAlign.center,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double displayedHeight = needToBeDisplayed ? height ?? 50 : 0;
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: color,
        height: displayedHeight,
        child: Align(child: _getListFromErrors(errors)));
  }

  get needToBeDisplayed => errors.isNotEmpty;

  SnackBar getSnackBar(BuildContext context) {
    return SnackBar(
        padding: EdgeInsets.zero,
        duration: const Duration(milliseconds: 10000),
        content: this);
  }
}
