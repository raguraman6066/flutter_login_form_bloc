part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final String uid;

  AuthSuccessState(this.uid);
}

final class AuthFailureState extends AuthState {
  final String message;

  AuthFailureState({required this.message});
}

final class AuthLoading extends AuthState {}
