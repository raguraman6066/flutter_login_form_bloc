import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_validation_bloc/bloc/auth_bloc.dart';
import 'package:login_validation_bloc/login_screen.dart';
import 'package:login_validation_bloc/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitialState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final authState = context.watch<AuthBloc>().state as AuthSuccessState;
          return Column(
            children: [
              if (state is AuthSuccessState)
                Center(
                  child: Text(state.uid),
                ),
              if (state is AuthInitialState)
                Center(
                  child: Text('Initial State'),
                ),
              GradientButton(onCallback: () {
                context.read<AuthBloc>().add(LogoutEvent());
              })
            ],
          );
          ;
        },
      ),
    );
  }
}
