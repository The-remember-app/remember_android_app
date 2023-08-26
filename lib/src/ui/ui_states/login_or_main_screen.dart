import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import '../../../network_processor/network_main.dart';
import '../../domain_layer/providers/user_api_provider.dart';
import '../../repositoris/db_data_source/http_utils.dart';
import '../../repositoris/db_data_source/user.dart';
import '../../urils/db/abstract_entity.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';
import 'await_user_screen.dart';
import '../pages/login/LoginScreen.dart';
import '../pages/modules/modules.dart';
import '../ui_templates/abstract_ui.dart';
import 'login_or_status_bar.dart';
import 'main_content.dart';



class LoginOrMainScreen extends StatefulWidget {

  final AsyncSnapshot<UserDbDS?> snapshot;

  LoginOrMainScreen(this.snapshot) : super();

  @override
  _LoginOrMainScreenState createState() => _LoginOrMainScreenState();

}


class _LoginOrMainScreenState extends AbstractUIStatefulWidget<LoginOrMainScreen>{

  @override
  Widget build(BuildContext context) {
    var pr = Provider.of<UserApiProfile>(context, listen: false);
    var snapshot = widget.snapshot;
    return choiceNextScreen(pr);
  }

  Widget choiceNextScreen(UserApiProfile  userApi){
    if (userApi.user != null && userApi.user!.active) {
      // Navigator.pushNamed(
      //   context,
      //   '/root_folder',
      //   arguments: Map<String, dynamic>(),
      // );
      print(22222222444444444);
      return MainContent();
    } else {
      // Navigator.pushNamed(
      //   context,
      //   '/login_screen',
      //   arguments: Map<String, dynamic>(),
      // );
      print(111111113333333333);
      return AuthScreen();
    }
  }

}
