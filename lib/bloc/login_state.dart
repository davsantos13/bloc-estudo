import 'package:bloc_study/bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../user.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class StartLoginState extends LoginState {
  @override
  List<Object> get props => null;
}

class SuccessLoginState extends LoginState {
  final User user;

  SuccessLoginState({this.user});

  @override
  List<Object> get props => null;
}

class ErrorLoginState extends LoginState {
  final String msg;

  ErrorLoginState({this.msg});

  @override
  List<Object> get props => [msg];
}
