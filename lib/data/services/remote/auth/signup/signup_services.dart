import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_bet_system/data/services/remote/auth/signup/signup_response.dart';

import '../../../../../presentation/resources/strings_manager.dart';

class SignUpServices {
  Future<SignUpResponse> defaultSignUp(
      {required String email, required String password}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      final userCerdintials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCerdintials.user;
      // user = FirebaseAuth.instance.currentUser;
      return SignUpResponse(
          message: AppStrings.createdSuccessfully, user: user);
    } on FirebaseAuthException catch (error) {
      print(error.code);
      if (error.code == AppStrings.firebaseAuthSocketException) {
        throw AppStrings.networkError;
      }
      rethrow;
    } on SocketException catch (_) {
      throw AppStrings.networkError;
    } catch (error) {
      throw AppStrings.unknownError;
    }
  }

  Future<void> signOut() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
