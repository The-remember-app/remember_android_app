

import 'http_answer.dart';

class LoginUserIsolateMsg{
  final String username;
  final String password;
  final String? serverUrl;

  LoginUserIsolateMsg(this.username, this.password, this.serverUrl);
}

class LoginUserAnsIsolateMsg extends CrossIsolateHttpAnswer<bool>{
  LoginUserAnsIsolateMsg(super.statusCode, super.data);

}