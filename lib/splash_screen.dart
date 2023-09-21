import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0822),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Centered Image
            Image.asset(
              'lib/assets/splash.png',
              width: 200.0,
              height: 200.0,
            ),
            const Text(
              'Keep reading,',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.addressCity,
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              'you will fall in love',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),

          
            Container(
              width: 300.0, 
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text(
                "Elevate your reading experience with our eBook app's captivating splash screen. Immerse yourself in a world of literature as you embark on a literary journey like never before",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30.0),

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/login");
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF4738CB),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
