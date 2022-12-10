import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bet_system/blocs/auth/login_cubit/login_cubit.dart';
import 'package:smart_bet_system/blocs/auth/signup_cubit/sign_up_cubit.dart';
import 'package:smart_bet_system/presentation/resources/strings_manager.dart';
import 'package:smart_bet_system/presentation/screens/auth/signin/signin.dart';
import 'package:smart_bet_system/presentation/screens/home/home.dart';

import '../data/services/local/cache/prefs.dart';
import '../presentation/resources/theme_manager.dart';

class SmartPetApp extends StatelessWidget {
  // const SmartPetApp({super.key});
  // apply singlton dp for this class - gonna be used once.
  const SmartPetApp._internal();
  static const SmartPetApp _instance = SmartPetApp._internal();
  factory SmartPetApp() => _instance;

  @override
  Widget build(BuildContext context) {
    // handling landscape case in mobile orientation to keep the UI presistent.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(context),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LoginCubit()),
            BlocProvider(create: (context) => SignUpCubit()),
          ],
          child: decideWhereToGo(),
        ),
      ),
    );
  }
}

Widget decideWhereToGo() {
  bool isAuthenticated = PreferenceUtils.getBool(PrefsEnum.isAuthenticated);
  if (isAuthenticated) {
    return const HomeScreen();
  }
  return const SignInScreen();
}
