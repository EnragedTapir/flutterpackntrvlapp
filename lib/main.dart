import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flash_screen.dart'; // Importowanie pliku z FlashScreen
import 'nextPage.dart'; // Importowanie pliku z następnym ekranem

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isFirstTime ? FlashScreen() : NextPage(),
    );
  }
}
Future<void> resetFirstTimeFlag() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isFirstTime', true);
}

