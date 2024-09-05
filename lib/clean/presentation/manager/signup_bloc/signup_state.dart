abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {
  const SignupInitial();
}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final String error;

  const SignupFailure({
    required this.error,
  });
}
