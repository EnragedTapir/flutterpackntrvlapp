import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'flash_screen.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You are now on the Next Page',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isFirstTime', true); // Resetowanie flagi
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  FlashScreen()), // Powrót do FlashScreen
                );
              },
              child: const Text('Reset to FlashScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
