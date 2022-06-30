import 'package:flutter/material.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/internal_icon_button.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.of(context).primaryBackground,
      automaticallyImplyLeading: false,
      flexibleSpace: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: InternalIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: AppTheme.of(context).primaryText,
                      size: 24,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: Text(
                    'back',
                    style: AppTheme.of(context).title1.override(
                          fontFamily: 'Roboto Slab',
                          fontSize: 16,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
            child: Text(
              pageTitle,
              style: AppTheme.of(context).title1.override(
                    fontFamily: 'Roboto Slab',
                    fontSize: 32,
                  ),
            ),
          ),
        ],
      ),
      actions: const [],
      elevation: 0,
    );
  }
}
