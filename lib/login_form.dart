import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login_bloc.dart';
import 'package:flutter_login/login_event.dart';
import 'package:flutter_login/login_state.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState> (
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ),
    );
        }
        },
      child: BlocBuilder<LoginBloc, LoginState> (
    builder: (context, state) {
      return Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'username'),
              controller: _usernameController,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'password'),
              controller: _passwordController,
              obscureText: true,
            ),
            RaisedButton(
              onPressed: state is! LoginLoading ? _onLoginButtonPressed : null,
              child: Text('Login'),
            ),
            Container(
              child: state is LoginLoading ? CircularProgressIndicator() : null,
            )
          ],
        ),
      );
    }),
    );
  }
}