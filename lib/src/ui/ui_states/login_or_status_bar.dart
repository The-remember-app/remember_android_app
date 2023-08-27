import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain_layer/providers/auth/auth_screen_provider.dart';
import '../pages/login/LoginScreen.dart';
import '../ui_templates/abstract_ui.dart';


class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthScreenProvider()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: LoginOrStatusBarChoice(),
    );
  }
}


class LoginOrStatusBarChoice extends StatefulWidget {

  LoginOrStatusBarChoice() : super();

  @override
  _LoginOrStatusBarChoiceState createState() => _LoginOrStatusBarChoiceState();
}

class _LoginOrStatusBarChoiceState
    extends AbstractUIStatefulWidget<LoginOrStatusBarChoice> {

  _LoginOrStatusBarChoiceState() : super();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthScreenProvider>(
        builder: (context, authProvider, child) {
          return choiceNextScreen(authProvider);
        });
  }

  Widget choiceNextScreen(AuthScreenProvider authProvider) {
    if (authProvider.isLoading){
      return CircularProgressIndicator();
    }
    return LoginScreen();
  }
}