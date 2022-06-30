// import '../auth/auth_util.dart';
import 'package:myaccount/commons/widgets/internal_button.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/internal_icon_button.dart';
import 'package:flutter/material.dart';

class ForgotWidget extends StatefulWidget {
  const ForgotWidget({Key? key}) : super(key: key);

  @override
  _ForgotWidgetState createState() => _ForgotWidgetState();
}

class _ForgotWidgetState extends State<ForgotWidget> {
  late TextEditingController emailAddressController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: AppTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        'Back',
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
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                child: Text(
                  'Forgot Password',
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
        ),
      ),
      backgroundColor: AppTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: Text(
                      'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
                      style: AppTheme.of(context).bodyText2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
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
              child: TextFormField(
                controller: emailAddressController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Your email address...',
                  labelStyle: AppTheme.of(context).bodyText2,
                  hintText: 'Enter your email...',
                  hintStyle: AppTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF57636C),
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
                      EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                ),
                style: AppTheme.of(context).bodyText1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
            child: InternalButtonWidget(
                onPressed: () async {
                  if (emailAddressController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Email required!',
                        ),
                      ),
                    );
                    return;
                  }
                  // TODO state call
                  // await resetPassword(
                  //   email: emailAddressController.text,
                  //   context: context,
                  // );
                },
                text: 'Send Link',
                options: InternalButtonOptions.of(context)
                    .override(color: AppTheme.of(context).alternate)),
          ),
        ],
      ),
    );
  }
}
