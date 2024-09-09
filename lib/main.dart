import 'package:ecommerce/clean/data/repositories/items_repositories_implement.dart';
import 'package:ecommerce/clean/data/repositories/user_repositories_implement.dart';
import 'package:ecommerce/clean/domain/repositories/items_repositorie.dart';
import 'package:ecommerce/clean/domain/repositories/user_repositorie.dart';
import 'package:ecommerce/clean/presentation/pages/login_screen_clean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepositories>(
          create: (_) => UserRepositoriesImplement(),
        ),
        RepositoryProvider<ItemsRepositorie>(
          create: (_) => ItemRepositoriesImplement(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  LoginScreenClean(), // Initial screen
      ),
    );
  }
}
