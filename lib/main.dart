import 'package:chandoiqua/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

bool loginMethod = false;
int? language;
bool isDark = false;
bool isFirstStart = true;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  language = prefs.getInt('language');
  isDark = prefs.getBool("isDark") ?? false;
  isFirstStart = prefs.getBool("firstStart") ?? true;
  loginMethod = prefs.getBool("login") ?? false;
  runApp(const MyApp());
}
