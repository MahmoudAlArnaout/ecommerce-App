import 'package:ecommerce/clean/domain/use_case/get_user_by_email.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user_model.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  final GetUserByEmail getUserByEmail;

  LoginBloc(GetUserByEmail getUser)
      : getUserByEmail = getUser,
        super(const LoginInitial()) {
    on<LoginSubmitted>(userCheck);
  }

  void userCheck(LoginSubmitted event, Emitter<LoginState> emit) async {
    User? user = (await getUserByEmail.execute(event.email));
    if (user != null) {
      if (event.email != user.email || event.password != user.password) {
        emit(LoginFailure(error: "invalid email or password"));
      } else {
        emit(LoginSuccess());
      }
    } else {
      emit(LoginFailure(error: "invalid email or password"));
    }
  }
}
