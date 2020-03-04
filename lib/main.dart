import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication_bloc.dart';
import 'package:flutter_login/authentication_event.dart';
import 'package:flutter_login/splash_page.dart';
import 'package:flutter_login/user_repository.dart';

import 'authentication_state.dart';
import 'home_page.dart';
import 'loading_indicator.dart';
import 'login_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    // TODO: implement onError
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate  = SimpleBlocDelegate();
  final userRepository = UserRepository();
  
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
      },
      child: App(
        userRepository: userRepository
      ),
    )
  );
}

class App extends StatelessWidget {
final UserRepository userRepository;

App({Key key, @required this.userRepository}) : super(key: key);

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationUnitialized) {
          return SplashPage();
        }
        if (state is AuthenticationAuthenticated) {
          return HomePage();
        }
        if (state is AuthenticationUnauthenticated) {
          return LoginPage(userRepository: userRepository);
        }
        if (state is AuthenticationLoading) {
          return LoadingIndicator();
        }
        return null;
      },
    ),
  );
}
}