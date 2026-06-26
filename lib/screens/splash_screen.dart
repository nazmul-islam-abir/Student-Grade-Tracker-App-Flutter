// screens/splash_screen.dart
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
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    setState(() {
      _currentPage = _pageController.page?.round() ?? 0;
      _isLastPage = _currentPage == 2;
    });
  }

  void _goToNextPage() {
    if (_isLastPage) {
      _navigateToHome();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AddSubjectScreen()),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check if the current theme is dark
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                _isLastPage = index == 2;
              });
            },
            children: [
              OnboardingPage(
                imagePath: "assets/entry.png",
                title: "Quick Entry",
                description:
                    "Easily add your subjects and mid-term marks to keep your tracker up to date.",
                isDark: isDark,
              ),
              OnboardingPage(
                imagePath: "assets/organized.png",
                title: "Stay Organized",
                description:
                    "View all your subjects in one place and see your calculated grades instantly.",
                isDark: isDark,
              ),
              OnboardingPage(
                imagePath: "assets/lib.png",
                title: "Academic Insights",
                description:
                    "Get a high-level overview of your overall GPA and performance trends.",
                isDark: isDark,
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _navigateToHome,
                    child: Text(
                      "Skip",
                      style: GoogleFonts.roboto(
                        color: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.color?.withOpacity(0.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ScrollingDotsEffect(
                      dotColor:
                          Theme.of(
                            context,
                          ).textTheme.bodyMedium?.color?.withOpacity(0.3) ??
                          Colors.grey,
                      activeDotColor: Theme.of(context).primaryColor,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 12,
                      radius: 4,
                      activeDotScale: 1.2,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _goToNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      _isLastPage ? "Get Started" : "Next",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isDark;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenSize.width * 0.65,
                width: screenSize.width * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(imagePath, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 48),
              Text(
                title,
                style: GoogleFonts.croissantOne(
                  fontSize: 32,
                  color: Theme.of(context).textTheme.headlineMedium?.color,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: GoogleFonts.robotoMono(
                  fontSize: 16,
                  color: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.color?.withOpacity(0.7),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
