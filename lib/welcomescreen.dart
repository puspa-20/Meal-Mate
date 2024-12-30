import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_mate/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required void Function() onGetStarted});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              const RecipeHomePage(), // Replace with your home screen widget.
        ),
      );
    });

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 233, 221, 96), // Teal background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/foodlogo.png", // Replace with your image asset.
                  height: 200, // Adjust the size as needed.
                  width:
                      200, // Ensure width matches height for a perfect circle.
                  fit: BoxFit
                      .cover, // Ensures the image fills the circular shape.
                ),
              ),
              const SizedBox(height: 20),
              // Text(
              //   "Meal_Mate",
              //   style: TextStyle(
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //     fontFamily: 'PlayfairDisplay', // Specify the custom font
              //   ),
              // )
              Text(
                "Meal_Mate",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 40, // Slightly larger font size for more prominence
                  fontWeight: FontWeight
                      .w900, // Extra-bold weight for a more striking look
                  color: Colors.lightGreen.shade900,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4.0,
                      color: Colors.black
                          .withOpacity(0.5), // Adds a subtle shadow for depth
                    ),
                  ],
                  letterSpacing: 2.0, // Spaced out letters for elegance
                ),
                textAlign: TextAlign.center, // Centers the text horizontally
              ),

              // Text(
              //   "Meal_Mate",
              //   style: GoogleFonts.playfairDisplay(
              //     // Use GoogleFonts to apply the font
              //     fontSize: 32,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
