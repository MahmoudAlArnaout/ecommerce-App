abstract class SignupEvent {}

class SignupSubmitted extends SignupEvent {
  final String email;
  final String password;
  final String username;
  final String confirmPassword;

  SignupSubmitted(
      {required this.email,
      required this.password,
      required this.username,
      required this.confirmPassword});
}


