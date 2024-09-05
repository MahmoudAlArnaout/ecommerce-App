abstract class LoginEvents {}

class LoginSubmitted extends LoginEvents {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}

class EmailSubmitted extends LoginEvents {
  final String email;

  EmailSubmitted({required this.email});
}

class PassWordSubmitted extends LoginEvents {
  final String password;

  PassWordSubmitted({required this.password});
}
