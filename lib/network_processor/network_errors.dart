

class UserNotActiveException implements Exception {
  UserNotActiveException();
}

class ServerUrlIsUnavailable implements Exception {
  ServerUrlIsUnavailable();
}

class AuthErrorUserPasswordNotCorrect implements Exception {
  final String url;
  final String username;
  final String password;
  AuthErrorUserPasswordNotCorrect(this.url, this.username, this.password);
}
