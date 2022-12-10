import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_bet_system/blocs/auth/login_cubit/login_cubit.dart';
import 'package:smart_bet_system/presentation/resources/color_manager.dart';
import 'package:smart_bet_system/presentation/screens/home/home.dart';

import '../../../../resources/constants_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../widgets/unborderd_text_field.dart';
import '../../signup/signup.dart';

class SignInFrom extends StatefulWidget {
  const SignInFrom({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInFrom> createState() => _SignInFromState();
}

class _SignInFromState extends State<SignInFrom> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.17, // dividing factor to keep the UI responsive.
          ),
          Text(
            AppStrings.appName,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.06, // dividing factor to keep the UI responsive.
          ),
          UnborderdTextField(
              hintText: AppStrings.email, controller: emailController),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.02, // dividing factor to keep the UI responsive.
          ),
          // password txt field
          UnborderdTextField(
            controller: passwordController,
            obscureText: true,
            hintText: AppStrings.password,
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.017, // dividing factor to keep the UI responsive.
          ),
          GestureDetector(
            onTap: () {
              // TODO: implement on forgot password tap.
            },
            child: Text(
              AppStrings.forgotYourPassowrdQ,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: ColorManager.grey),
            ),
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.02, // dividing factor to keep the UI responsive.
          ),
          buidSigninButton(),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.01, // dividing factor to keep the UI responsive.
          ),
          Text(
            AppStrings.or,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: ColorManager.grey),
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.01, // dividing factor to keep the UI responsive.
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: implement on sign up pressed
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => const SignUpScreen(),
                ),
              );
            },
            child: const Text(AppStrings.signUp),
          ),
        ],
      ),
    );
  }

  BlocConsumer<LoginCubit, LoginState> buidSigninButton() {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Fluttertoast.showToast(
              msg: state.successMsg ?? AppStrings.loginSuccess);
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (_) => const HomeScreen()));
        } else if (state is LoginError) {
          Fluttertoast.showToast(
              msg: state.errorMsg ?? AppStrings.unknownError);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CircularProgressIndicator();
        }
        return ElevatedButton(
          onPressed: () {
            // TODO: implement on sign in pressed
            if (formKey.currentState?.validate() ?? false) {
              BlocProvider.of<LoginCubit>(context).defaultLogin(
                  email: emailController.text,
                  password: passwordController.text);
            }
          },
          child: const Text(AppStrings.signIn),
        );
      },
    );
  }
}
