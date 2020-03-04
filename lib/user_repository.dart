import 'package:flutter/cupertino.dart';

class UserRepository {

  Future<String> authentication({
    @required String username,
    @required String password
}) async {
    await Future<String>.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    await Future<void>.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken() async {
    await Future<void>.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    await Future<bool>.delayed(Duration(seconds: 1));
    return false;
  }
}