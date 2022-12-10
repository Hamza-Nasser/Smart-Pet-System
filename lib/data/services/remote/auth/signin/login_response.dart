import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class LoginResponse {
  final String? message;
  final User? user;
  const LoginResponse({this.message, this.user});
}
