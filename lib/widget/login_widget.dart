import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:myaccount/app/nav.dart';
import 'package:myaccount/commons/constants/routes.dart';
import 'package:myaccount/commons/theme.dart';
import 'package:myaccount/commons/widgets/button.dart';
import 'package:myaccount/widget/enable_local_auth_modal_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:user_repository/user_repository.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, this.title = "Login"}) : super(key: key);

  final String title;

  @override
  State<LoginWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _storage = const FlutterSecureStorage();
  final String KEY_USERNAME = "KEY_USERNAME";
  final String KEY_PASSWORD = "KEY_PASSWORD";
  final String KEY_LOCAL_AUTH_ENABLED = "KEY_LOCAL_AUTH_ENABLED";

  final TextEditingController _usernameController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");

  bool passwordHidden = true;
  bool _savePassword = true;

  var localAuth = LocalAuthentication();

  // Read values
  Future<void> _readFromStorage() async {
    bool isLocalAuthEnabled =
        (await _storage.read(key: "KEY_LOCAL_AUTH_ENABLED") ?? "false") ==
            "true";

    if ("true" == isLocalAuthEnabled) {
      bool didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Please authenticate to sign in');

      if (didAuthenticate) {
        _usernameController.text = await _storage.read(key: KEY_USERNAME) ?? '';
        _passwordController.text = await _storage.read(key: KEY_PASSWORD) ?? '';
      }
      return;
    }
    _usernameController.text = await _storage.read(key: KEY_USERNAME) ?? '';
    _passwordController.text = await _storage.read(key: KEY_PASSWORD) ?? '';
  }

  _onFormSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_savePassword) {
        await _storage.write(key: KEY_LOCAL_AUTH_ENABLED, value: "false");

        // Write values
        await _storage.write(
            key: KEY_USERNAME, value: _usernameController.text);
        await _storage.write(
            key: KEY_PASSWORD, value: _passwordController.text);

        if (await localAuth.canCheckBiometrics) {
          // Ask for enable biometric auth
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return EnableLocalAuthModalBottomSheet(
                  action: _onEnableLocalAuth);
            },
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text("Impossible d'accèder à l'authentification biométriue"),
          ));
        }
      }
    }
  }

  _onEnableLocalAuth() async {
    await _storage.write(key: KEY_LOCAL_AUTH_ENABLED, value: "true");

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
          "Authentification autorisée.\nMerci de redémarrer l'application pour l'application des mises à jours"),
    ));
  }

  _onForgotPassword() async {
    await Navigator.of(context).pushNamed(Routes.forgot);
  }

  _onRegister() async {
    await Navigator.of(context).pushNamed(Routes.register);
  }

  @override
  void initState() {
    super.initState();
    _readFromStorage();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final primaryColor = AppTheme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Color(0xFF161925),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.all(size.width - size.width * .85),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .10,
              ),
              Text(
                "welcome",
                style: TextStyle(
                    color: AppTheme.of(context).secondaryText,
                    fontWeight: FontWeight.w600,
                    fontSize: 32),
              ).tr(),
              SizedBox(
                height: size.height * .15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "login.email".tr(),
                        labelStyle: TextStyle(
                            color: AppTheme.of(context).secondaryText),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                              color: AppTheme.of(context).secondaryColor,
                              width: 2),
                        ),
                      ),
                      controller: _usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'form.required'.tr();
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        return value!.isEmpty ? "form.required".tr() : null;
                      },
                      decoration: InputDecoration(
                        labelText: "login.password.value".tr(),
                        labelStyle: TextStyle(
                            color: AppTheme.of(context).secondaryText),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                              color: AppTheme.of(context).secondaryColor,
                              width: 2),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passwordHidden = !passwordHidden;
                            });
                          },
                          child: Icon(
                            passwordHidden
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xff747881),
                            size: 23,
                          ),
                        ),
                      ),
                      controller: _passwordController,
                      obscureText: passwordHidden,
                      enableSuggestions: false,
                      toolbarOptions: const ToolbarOptions(
                        copy: false,
                        paste: false,
                        cut: false,
                        selectAll: false,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .045,
              ),
              CheckboxListTile(
                value: _savePassword,
                onChanged: (bool? newValue) {
                  setState(() {
                    _savePassword = newValue!;
                  });
                },
                title: const Text("login.password.remember").tr(),
                activeColor: AppTheme.of(context).secondaryColor,
              ),
              SizedBox(
                height: size.height * .05,
              ),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: _onFormSubmit,
                  style: ElevatedButton.styleFrom(
                      primary: AppTheme.of(context).secondaryColor,
                      padding: EdgeInsets.all(20),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: const Text("login.connect").tr(),
                ),
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Center(
                child: InkWell(
                  onTap: _onForgotPassword,
                  child: Text(
                    "login.password.forgotten",
                    style: TextStyle(
                        color: AppTheme.of(context).secondaryText,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ).tr(),
                ),
              ),
              SizedBox(
                height: size.height * .035,
              ),
              Center(
                child: const Text(
                  "register.no_account",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ).tr(),
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Center(
                // padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: InternalButtonWidget(
                  onPressed: _onRegister,
                  text: 'register.value'.tr(),
                  options: InternalButtonOptions(
                    width: 270,
                    height: 50,
                    color: AppTheme.of(context).primaryText,
                    textStyle: AppTheme.of(context).subtitle2.override(
                          fontFamily: 'Roboto Slab',
                          color: AppTheme.of(context).secondaryBackground,
                          fontSize: 16,
                        ),
                    elevation: 3,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
