import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication_bloc.dart';
import 'package:flutter_login/authentication_event.dart';
import 'package:flutter_login/login_event.dart';
import 'package:flutter_login/login_state.dart';
import 'package:flutter_login/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc
}) : assert(userRepository != null && authenticationBloc != null);

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: implement mapEventToState
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authentication(username: event.username, password: event.password);

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}