part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class SignInSuccess extends LoginState {
  const SignInSuccess(
    this.result,
  );
  final String result;

  @override
  List<Object?> get props => [result];
}

class SignInError extends LoginState {
  const SignInError(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

class SignInLoading extends LoginState {
  const SignInLoading();
}

class Unauthenticated extends LoginState {
  const Unauthenticated();
}
