import 'package:ecommerce/basic_flutter/DataBaseConnection.dart';
import 'package:ecommerce/basic_flutter/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  final DatabaseConnection databaseConnection;

  LoginBloc(DatabaseConnection dbConnection)
      : databaseConnection = dbConnection,
        super(const LoginInitial()) {
    on<LoginSubmitted>(userCheck);
  }

  void userCheck(LoginSubmitted event, Emitter<LoginState> emit) async {
    User? user =
        await databaseConnection.userVerification(event.email, event.passWord);
    if (user != null){
      emit (LoginSuccess());
    }
    else{
      emit(LoginFailure(error: "invalid email or password"));
    }

  }
}
