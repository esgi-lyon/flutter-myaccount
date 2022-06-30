import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class FormMessage extends StatelessWidget {
  const FormMessage(
      {Key? key,
      required this.status,
      required this.color,
      required this.validatedProperties,
      this.infos,
      this.height})
      : super(key: key);
  final FormzStatus status;

  final Color color;

  final List<Object?>? validatedProperties;

  final double? height;

  final bool? infos;

  String translateIssue(dynamic f) => f?.toString().tr() ?? '';

  List<String> parseErrors(List<dynamic>? errors) =>
      errors
          ?.where((e) => e != null)
          .where((e) => e is FormzInput && !e.pure)
          .map((e) => (e as FormzInput).error)
          .map(translateIssue)
          .where((e) => e.isNotEmpty)
          .toList() ??
      [];

  List<String> parseInfos(List<dynamic>? errors) =>
      errors?.where((e) => e != null).map(translateIssue).toList() ?? [];

  _getListFromMessages(List<String>? errors) {
    if (errors == null || errors.isEmpty) {
      return const Padding(padding: EdgeInsets.zero);
    }

    return ListView.builder(
      itemCount: errors.length,
      controller: ScrollController(),
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
    final messages = infos ?? false
        ? parseInfos(validatedProperties)
        : parseErrors(validatedProperties);
    final double displayedHeight = messages.isNotEmpty ? (height ?? 40) : 0;

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: color,
        height: displayedHeight,
        child: Align(child: _getListFromMessages(messages)));
  }

  SnackBar getSnackBar(BuildContext context) => SnackBar(
        padding: EdgeInsets.zero,
        content: this,
        duration: const Duration(seconds: 4),
      );
}
