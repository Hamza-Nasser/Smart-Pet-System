import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bet_system/blocs/auth/login_cubit/login_cubit.dart';
import 'package:smart_bet_system/presentation/resources/strings_manager.dart';
import 'package:smart_bet_system/presentation/screens/auth/signin/signin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<LoginCubit>(context, listen: false)
                .signOut()
                .then((value) {
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (_) => const SignInScreen(),
                ),
              );
            });
          },
          child: const Text(AppStrings.signOut),
        ),
      ),
    );
  }
}
