import 'package:flutter/material.dart';
import 'package:smart_bet_system/presentation/resources/color_manager.dart';
import 'package:smart_bet_system/presentation/resources/strings_manager.dart';
import 'package:smart_bet_system/presentation/resources/values_manager.dart';

import '../../../resources/constants_manager.dart';
import 'buildings/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // saving the mobile height and width in a single run, to use it everywhere else without calling MediaQuery.
    ConstantUtils.screenHeight = MediaQuery.of(context).size.height;
    ConstantUtils.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.signIn,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        centerTitle: true,
        backgroundColor: ColorManager.background,
        elevation: AppSize.standerdElevation,
      ),
      body: const SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: SignInFrom(),
          ),
        ),
      ),
    );
  }
}
