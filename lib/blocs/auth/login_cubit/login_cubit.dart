import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:smart_bet_system/data/services/remote/auth/signin/login_response.dart';
import 'package:smart_bet_system/data/services/remote/auth/signin/login_services.dart';
import 'package:smart_bet_system/presentation/resources/strings_manager.dart';

import '../../../data/services/local/cache/prefs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginServices loginServices = LoginServices();

  User? user;
  Future<void> defaultLogin(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      LoginResponse response =
          await loginServices.defaultLogin(email: email, password: password);
      user = response.user;
      await cacheLogin();
      emit(LoginSuccess(response.message));
    } on FirebaseAuthException catch (error) {
      emit(LoginError(error.message));
    } on SocketException catch (error) {
      print(error.message);
      emit(LoginError(AppStrings.networkError));
    } on String catch (error) {
      emit(LoginError(error));
    } catch (error) {
      emit(LoginError(AppStrings.unknownError));
    }
  }

  Future<void> cacheLogin() async {
    await PreferenceUtils.setBool(PrefsEnum.isAuthenticated, true);
  }

  Future<void> signOut() async {
    await loginServices.signOut();
    await PreferenceUtils.setBool(PrefsEnum.isAuthenticated, false);
  }
}
