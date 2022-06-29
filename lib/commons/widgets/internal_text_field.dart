import 'package:flutter/material.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:easy_localization/easy_localization.dart';

class InternalTextField extends StatelessWidget {
  const InternalTextField(
      {Key? key,
      this.textController,
      required this.labelText,
      required this.hintText,
      required this.errorText,
      this.onChanged,
      })
      : super(key: key);

  final TextEditingController? textController;
  final String labelText;
  final String hintText;
  final String? errorText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: AppTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x4D101213),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: textController,
          obscureText: false,
          onChanged: onChanged,
        
          decoration: InputDecoration(
            labelText: labelText.tr(),
            labelStyle: AppTheme.of(context).bodyText2,
            hintText: hintText.tr(),
            errorText: errorText,
          
            hintStyle: AppTheme.of(context).bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: AppTheme.of(context).secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: AppTheme.of(context).secondaryBackground,
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
          ),
          style: AppTheme.of(context).bodyText1,
        ),
      ),
    );
  }
}
