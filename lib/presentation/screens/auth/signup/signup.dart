import 'package:flutter/material.dart';
import 'package:smart_bet_system/presentation/resources/color_manager.dart';
import 'package:smart_bet_system/presentation/resources/strings_manager.dart';
import 'package:smart_bet_system/presentation/resources/values_manager.dart';

import 'buildings/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.signUp,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        centerTitle: true,
        backgroundColor: ColorManager.background,
        elevation: AppSize.standerdElevation,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: Text(
              AppStrings.cancel,
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: ColorManager.black,
                  ),
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
