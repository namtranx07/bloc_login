import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication_bloc.dart';
import 'package:flutter_login/login_bloc.dart';
import 'package:flutter_login/user_repository.dart';
import 'package:flutter_login/login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository}) : assert(userRepository != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository);
        },
        child: LoginForm(),
      ),
    );
  }
}