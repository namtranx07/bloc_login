import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();


}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
      @required this.username,
      @required this.password
    });


  @override
  // TODO: implement props
  List<Object> get props => [username, password];


  @override
  String toString() {
    // TODO: implement toString
    return 'LoginButtonPressed { username: $username, password: $password }';
  }
}

