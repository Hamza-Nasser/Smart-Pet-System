import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../data/services/remote/auth/signup/signup_response.dart';
import '../../../data/services/remote/auth/signup/signup_services.dart';
import '../../../presentation/resources/strings_manager.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  SignUpServices signUpServices = SignUpServices();
  Future<void> defaultSignUp(
      {required String email, required String password}) async {
    emit(SignUpLoading());
    try {
      SignUpResponse response =
          await signUpServices.defaultSignUp(email: email, password: password);

      emit(SignUpSuccess(response.message));
    } on FirebaseAuthException catch (error) {
      emit(SignUpError(error.message));
    } on SocketException catch (error) {
      print(error.message);
      emit(SignUpError(AppStrings.networkError));
    } on String catch (error) {
      emit(SignUpError(error));
    } catch (error) {
      emit(SignUpError(AppStrings.unknownError));
    }
  }

  Future<void> signOut() async {
    await signUpServices.signOut();
  }
}
