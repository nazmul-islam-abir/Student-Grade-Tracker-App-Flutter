import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'add_subject_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.7,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/quick.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 25),

                      Text(
                        "Quick Entry",
                        style: GoogleFonts.croissantOne(
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        textAlign: TextAlign.center,
                        "Easily add your subjects and mid-term marks to keep your tracker up to date.",
                        style: GoogleFonts.robotoMono(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.7,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/organized.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 25),

                      Text(
                        "Stay Organized",
                        style: GoogleFonts.croissantOne(
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        textAlign: TextAlign.center,
                        "View all your subjects in one place and see your calculated grades instantly.",
                        style: GoogleFonts.robotoMono(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.7,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/lib.png", fit: BoxFit.cover),
                      ),
                      SizedBox(height: 25),

                      Text(
                        "Academic Insights",
                        style: GoogleFonts.croissantOne(
                          fontSize: 32,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        textAlign: TextAlign.center,
                        "Get a high-level overview of your overall GPA and performance trends.",
                        style: GoogleFonts.robotoMono(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddSubjectScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: ScrollingDotsEffect(
                    dotColor: Colors.black,
                    activeDotColor: Colors.red,
                    activeStrokeWidth: 2.6,
                    activeDotScale: 1.3,
                    maxVisibleDots: 5,
                    radius: 8,
                    spacing: 16,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.nextPage(
                      duration: Duration(microseconds: 600),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
