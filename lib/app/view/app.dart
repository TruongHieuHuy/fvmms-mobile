import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quanlytauca/features/auth/data/repositories/auth_repository.dart';
import 'package:quanlytauca/features/auth/presentation/bloc/signin_bloc.dart';
import 'package:quanlytauca/features/auth/presentation/screens/signin_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => SigninBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          home: const SignInScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
