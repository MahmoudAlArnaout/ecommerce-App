import 'dart:io';
import 'package:ecommerce/blocs/models/user.dart';
import 'package:ecommerce/blocs/pages/home_screen.dart';
import 'package:ecommerce/blocs/pages/signup_screen.dart';
import 'package:ecommerce/clean/domain/repositories/user_repositorie.dart';
import 'package:ecommerce/clean/domain/use_case/get_user_by_email.dart';
import 'package:ecommerce/clean/presentation/pages/signup_screen_clean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/login_bloc/login_bloc.dart';
import '../manager/login_bloc/login_event.dart';
import '../manager/login_bloc/login_state.dart';




class LoginScreenClean extends StatelessWidget {
  late User user = User();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(GetUserByEmail(repositories: context.read<UserRepositories>())),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text("Close the App"),
                  content: Text("Are you sure?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("No"),
                    ),
                    TextButton(
                      onPressed: () => exit(0),
                      child: Text("Yes"),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Login"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return SegmentedButton(
                    segments: const <ButtonSegment<String>>[
                      ButtonSegment<String>(value: 'user', label: Text("User")),
                      ButtonSegment<String>(
                          value: 'admin', label: Text("Admin")),
                    ],
                    selected: {'user'},
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    width: 200,
                    height: 150,
                    child: Image.asset("images/ecommerce.webp"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextField(
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffix: Icon(Icons.email),
                        labelText: 'Email',
                        hintText: 'ex: abc@gmail.com',
                      ),
                      onChanged: (value) {
                        user.setEmail(value);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextField(
                      controller: TextEditingController(),
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffix: Icon(Icons.password),
                        labelText: 'Password',
                        hintText: 'Enter secure password',
                      ),
                      onChanged: (value) {
                        user.setPassword(value);
                      },
                    );
                  },
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else if (state is LoginFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error,
                          style: TextStyle(color: Colors.red),
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context).add(LoginSubmitted(
                            email: user.email!, password: user.password!));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 130),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreenClean()),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
