part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginButtonClickedEvent extends AuthEvent {
  final String email;
  final String password;

  LoginButtonClickedEvent({
    required this.email,
    required this.password,
  });
}

final class LogoutEvent extends AuthEvent {}
