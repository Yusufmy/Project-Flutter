class Auth {
  final String username;
  final String password;

  Auth({
    required this.username,
    required this.password,
  });

  bool checkLogin() {
    return username == "admin" && password == "admin";
  }
}
