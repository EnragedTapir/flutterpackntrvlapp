import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'nextPage.dart'; // Importowanie pliku z następnym ekranem

class FlashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height; // Uzyskujemy dostęp do wysokości ekranu

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/graf2.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.white70,
                      Colors.white54,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.3, 0.5, 0.55],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Text(
                    "Plan your",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                      fontFamily: 'Fustat',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Text(
                    "Adventure",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontFamily: 'Fustat',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Tekst jakis podany zeby costam bylo pokazane. '
                        'Tekst jakis podany zeby costam bylo pokazane. '
                        'Tekst jakis podany zeby costam bylo pokazane. Tekst jakis podany zeby costam bylo pokazane.',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isFirstTime', false);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const NextPage()),
                      );
                    },
                    child: const Text(
                      'Explore',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
            Positioned(
              top: screenHeight * 0.1 + 10,
              left: 10,
              right: 0,
              child: const Center(
                child: Text(
                  "Pack'n Travel",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.1,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  "Pack'n Travel",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}