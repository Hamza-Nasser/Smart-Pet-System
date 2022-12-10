import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_bet_system/data/services/remote/auth/signin/login_response.dart';

import '../../../../../presentation/resources/strings_manager.dart';

class LoginServices {
  Future<LoginResponse> defaultLogin(
      {required String email, required String password}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        user = FirebaseAuth.instance.currentUser;
        return LoginResponse(message: AppStrings.loginSuccess, user: user);
      } else {
        return LoginResponse(message: AppStrings.alreadyLogedIn, user: user);
      }
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
