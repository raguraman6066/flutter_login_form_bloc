import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<LoginButtonClickedEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final email = event.email;
        final password = event.password;
        if (password.length < 6) {
          return emit(AuthFailureState(
              message: 'password must be more than 6 characters'));
          //return;
        }
        await Future.delayed(
            Duration(
              seconds: 2,
            ), () {
          return emit(AuthSuccessState('$email-$password'));
        });
      } catch (e) {
        return emit(AuthFailureState(message: e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(
            Duration(
              seconds: 2,
            ), () {
          emit(AuthInitialState());
        });
      } catch (e) {
        emit(AuthFailureState(message: e.toString()));
      }
    });
  }
}
