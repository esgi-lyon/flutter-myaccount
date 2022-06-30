import 'package:easy_localization/easy_localization.dart';
import 'package:myaccount/app/simple_app_bar.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:flutter/material.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  SettingsWidgetState createState() => SettingsWidgetState();
}

class SettingsWidgetState extends State<SettingsWidget> {
  bool? switchListTileValue1;
  bool? switchListTileValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: SimpleAppBar('settings.value'.tr()),
      backgroundColor: AppTheme.of(context).primaryBackground,
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
            ).tr(),
            activeColor: AppTheme.of(context).secondaryColor,
            activeTrackColor: AppTheme.of(context).secondaryColor,
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding:
                const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
          ),
        ],
      ),
    );
  }
}
