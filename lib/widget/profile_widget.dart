import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/internal_button.dart';

import 'package:myaccount/features/authentication/authentication.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String uploadedFileUrl = '';
  late TextEditingController yourNameController;
  late TextEditingController emaiController;
  late TextEditingController myBioController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emaiController = TextEditingController();
    yourNameController = TextEditingController();
    myBioController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: AppTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                  child: Text(
                    'Edit Profile',
                    style: AppTheme.of(context).title2.override(
                          fontFamily: 'Roboto Slab',
                          color: AppTheme.of(context).primaryText,
                          fontSize: 22,
                        ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: AppTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDBE2E7),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Container(
                      width: 90,
                      height: 90,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1536164261511-3a17e671d380?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=630&q=80',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: yourNameController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  labelStyle: AppTheme.of(context).bodyText2,
                  hintStyle: AppTheme.of(context).bodyText2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.of(context).primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.of(context).primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: AppTheme.of(context).secondaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: AppTheme.of(context).bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: TextFormField(
                controller: emaiController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: AppTheme.of(context).bodyText2,
                  hintStyle: AppTheme.of(context).bodyText2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.of(context).primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.of(context).primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: AppTheme.of(context).secondaryBackground,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: AppTheme.of(context).bodyText1,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: TextFormField(
                controller: myBioController,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: AppTheme.of(context).bodyText2,
                  hintText: 'Your bio',
                  hintStyle: AppTheme.of(context).bodyText2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.of(context).primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppTheme.of(context).primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: AppTheme.of(context).secondaryBackground,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: AppTheme.of(context).bodyText1,
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: InternalButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Save Changes',
                  options: InternalButtonOptions(
                    width: 340,
                    height: 60,
                    color: AppTheme.of(context).primaryColor,
                    textStyle: AppTheme.of(context).subtitle2,
                    elevation: 2,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: AppTheme.of(context).buttonBorderRadius,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
