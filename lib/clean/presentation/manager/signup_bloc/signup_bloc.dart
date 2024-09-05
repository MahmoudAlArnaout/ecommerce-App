import 'package:ecommerce/basic_flutter/DataBaseConnection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/creat_user.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final CreateUser createUser;

  SignupBloc(CreateUser user)
      : createUser = user,
        super(SignupInitial()) {
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  void _onSignupSubmitted(
      SignupSubmitted event, Emitter<SignupState> emit) async {
    if (event.password == event.confirmPassword) {
      try {
        final inserted =
            await _signupUser(event.email, event.password, event.username);
        if (inserted) {
          emit(SignupSuccess());
        } else {
          emit(SignupFailure(error: "Signup failed. Please try again."));
        }
      } catch (error) {
        emit(SignupFailure(error: "no internet connection"));
      }
    } else {
      emit(SignupFailure(error: "Passwords do not match"));
    }
  }

  Future<bool> _signupUser(
      String email, String password, String username) async {
    if (await createUser.addUser(email, password, username)) {
      return true;
    }
    return false;
  }
}
