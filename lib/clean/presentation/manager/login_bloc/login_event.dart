abstract class LoginEvents {}

class LoginSubmitted extends LoginEvents {
  final String email;
  final String passWord;

  LoginSubmitted({required this.email, required this.passWord});
}

class EmailSubmitted extends LoginEvents {
  final String email;

  EmailSubmitted({required this.email});
}

class PassWordSubmitted extends LoginEvents {
  final String passWord;

  PassWordSubmitted({required this.passWord});
}
