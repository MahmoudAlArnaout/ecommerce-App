import 'package:ecommerce/basic_flutter/DataBaseConnection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final DatabaseConnection databaseConnection;

  SignupBloc(DatabaseConnection dbConnection)
      : databaseConnection = dbConnection,
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
        emit(SignupFailure(error: "An error occurred"));
      }
    } else {
      emit(SignupFailure(error: "Passwords do not match"));
    }
  }

  Future<bool> _signupUser(
      String email, String password, String username) async {
    if (await databaseConnection.insertUsers(email, password, username)) {
      return true;
    }
    return false;
  }
}
