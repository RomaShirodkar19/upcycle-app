import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpl_lab/components/button.dart';
import 'package:mpl_lab/pages/login_page.dart'; // Import LoginPage

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 226, 199),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "UpCycle",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 50,
                  color: const Color.fromARGB(255, 24, 62, 25),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Image.asset(
                  'lib/images/clothes.png',
                  width: MediaQuery.of(context).size.width * 0.7, // Responsive width
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(27.0),
                child: Text(
                  "Give New Life to Clothes & Books!",
                  style: GoogleFonts.mPlus1(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              MyButton(
                text: "Get Started",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
