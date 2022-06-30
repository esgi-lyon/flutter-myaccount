import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class FormMessage extends StatelessWidget {
  const FormMessage(
      {Key? key,
      required this.color,
      required this.validatedProperties,
      this.isInfo,
      this.height})
      : super(key: key);

  final Color color;

  final List<Object?>? validatedProperties;

  final double? height;

  final bool? isInfo;

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
        return Text(errors.elementAt(i), textAlign: TextAlign.center);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final messages = isInfo ?? false
        ? parseInfos(validatedProperties)
        : parseErrors(validatedProperties);
    final double displayedHeight = messages.isNotEmpty ? (height ?? 40) : 0;

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        color: color,
        height: displayedHeight,
        child: Align(child: _getListFromMessages(messages)));
  }

  showSnackBar(BuildContext context) => ScaffoldMessenger.of(context)
    ..clearSnackBars
    ..showSnackBar(SnackBar(
      padding: EdgeInsets.zero,
      content: this,
    ));
}
