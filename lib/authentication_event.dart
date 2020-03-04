import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvent  extends Equatable {
  const AuthenticationEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {

}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({@required this.token});

  @override
  // TODO: implement props
  List<Object> get props => [token];

  @override
  String toString() {
    // TODO: implement toString
    return 'LoggedIn with {token: $token}';
  }
}

class LoggedOut extends AuthenticationEvent {

}