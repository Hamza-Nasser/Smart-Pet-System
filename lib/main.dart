import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_bet_system/app/smart_pet_app.dart';

import 'debug_utils/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  // ensure Firebase is initialized before running.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  runApp(SmartPetApp());
}
