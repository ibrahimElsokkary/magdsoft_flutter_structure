part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class GlobalPasswordVisabilty extends GlobalState {}

class GlobalChangeLocale extends GlobalState {}

class GlobalLoginSuccess extends GlobalState {}

class GlobalLoginLoading extends GlobalState {}

class GlobalLoginError extends GlobalState {}

class GlobalRegisterSuccess extends GlobalState {
  final String message;

  GlobalRegisterSuccess(this.message);
}

class GlobalRegisterLoading extends GlobalState {}

class GlobalRegisterError extends GlobalState {
  final String message;

  GlobalRegisterError(this.message);
}


