import 'package:easy_localization/easy_localization.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/internal_button.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  bool? switchListTileValue1;
  bool? switchListTileValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'settings.value',
          style: AppTheme.of(context).title2.override(
                fontFamily: 'Roboto Slab',
                color: AppTheme.of(context).primaryText,
                fontSize: 22,
              ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: AppTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'settings.hint',
                    style: AppTheme.of(context).bodyText2,
                  ).tr(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: SwitchListTile.adaptive(
              value: switchListTileValue1 ??= true,
              onChanged: (newValue) =>
                  setState(() => switchListTileValue1 = newValue),
              title: Text(
                'settings.locale.value',
                style: AppTheme.of(context).title3,
              ),
              subtitle: Text(
                'settings.locale.hint',
                style: AppTheme.of(context).bodyText2,
              ).tr(),
              activeColor: AppTheme.of(context).secondaryColor,
              activeTrackColor: AppTheme.of(context).secondaryColor,
              dense: false,
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
            ),
          ),
          SwitchListTile.adaptive(
            value: switchListTileValue2 ??= true,
            onChanged: (newValue) =>
                setState(() => switchListTileValue2 = newValue),
            title: Text(
              'settings.biometric.value',
              style: AppTheme.of(context).title3,
            ).tr(),
            subtitle: Text(
              'settings.biometric.hint',
              style: AppTheme.of(context).bodyText2,
            ),
            activeColor: AppTheme.of(context).secondaryColor,
            activeTrackColor: AppTheme.of(context).secondaryColor,
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: InternalButtonWidget(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      content: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          height: 40,
                          color: AppTheme.of(context).secondaryColor,
                          child: Align(child: const Text("saved").tr()))));
              },
              text: 'apply'.tr(),
              options: InternalButtonOptions.of(context).override(
                  color: AppTheme.of(context).secondaryBackground,
                  textStyle: AppTheme.of(context).subtitle2),
            ),
          ),
        ],
      ),
    );
  }
}
