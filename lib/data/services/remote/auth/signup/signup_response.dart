import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class SignUpResponse {
  final String? message;
  final User? user;
  const SignUpResponse({this.message, this.user});
}
