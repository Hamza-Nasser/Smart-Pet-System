import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../blocs/auth/signup_cubit/sign_up_cubit.dart';
import '../../../../resources/constants_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../widgets/unborderd_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
        children: [
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.1, // dividing factor to keep the UI responsive.
          ),
          Text(
            AppStrings.appName,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.06, // dividing factor to keep the UI responsive.
          ),
          // First name, last name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: ConstantUtils.screenWidth * 0.445,
                child: const UnborderdTextField(
                  hintText: AppStrings.firstName,
                ),
              ),
              SizedBox(
                width: ConstantUtils.screenWidth * 0.445,
                child: const UnborderdTextField(
                  hintText: AppStrings.lastName,
                ),
              ),
            ],
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.01, // dividing factor to keep the UI responsive.
          ),
          UnborderdTextField(
            controller: emailController,
            hintText: AppStrings.emailAddress,
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.01, // dividing factor to keep the UI responsive.
          ),
          UnborderdTextField(
            controller: passwordController,
            hintText: AppStrings.choosePassword,
            obscureText: true,
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.01, // dividing factor to keep the UI responsive.
          ),
          const UnborderdTextField(
            hintText: AppStrings.birthDay,
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.01, // dividing factor to keep the UI responsive.
          ),
          const UnborderdTextField(
            hintText: AppStrings.gender,
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.01, // dividing factor to keep the UI responsive.
          ),
          const UnborderdTextField(
            hintText: AppStrings.phoneNumber,
          ),
          SizedBox(
            height: ConstantUtils.screenHeight *
                0.04, // dividing factor to keep the UI responsive.
          ),
          buildSignUpButton(),
        ],
      ),
    );
  }

  BlocConsumer<SignUpCubit, SignUpState> buildSignUpButton() {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SignUpSuccess) {
          Fluttertoast.showToast(
              msg: state.successMsg ?? AppStrings.createdSuccessfully);
          BlocProvider.of<SignUpCubit>(context, listen: false).signOut();
        } else if (state is SignUpError) {
          Fluttertoast.showToast(
              msg: state.errorMsg ?? AppStrings.unknownError);
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const CircularProgressIndicator();
        }
        return ElevatedButton(
          onPressed: () {
            // TODO: implement on sign up pressed
            if (formKey.currentState?.validate() ?? false) {
              BlocProvider.of<SignUpCubit>(context).defaultSignUp(
                email: emailController.text,
                password: passwordController.text,
              );
            }
          },
          child: const Text(AppStrings.signUp),
        );
      },
    );
  }
}
