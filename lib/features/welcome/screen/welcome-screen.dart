import 'package:care_hive/features/auth/screen/login-screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      // Navigate to the LoginScreen on finish
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  List<Widget> _buildPageContent() {
    return [
      _buildWelcomePage(
        "Get Connected to Online Consultation",
        "Improve the quality of the services for Patient Happiness.",
        'assets/bg.png',
        'assets/doc.png',
        Colors.blue,
      ),
      _buildWelcomePage(
        "Discover Our Experts",
        "Get connected to trusted professionals at your fingertips.",
        'assets/bg.png',
        'assets/doc_2.png',
        Colors.green,
      ),
      _buildWelcomePage(
        "Book Appointments Instantly",
        "Save time and book appointments with ease.",
        'assets/bg.png',
        'assets/doc_3.png',
        Colors.orange,
      ),
    ];
  }

  Widget _buildWelcomePage(String title, String content, String bgImagePath,
      String docImagePath, Color bgColor) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  bgImagePath, // Background image path
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 280,
                    child: Image.asset(
                      docImagePath, // Doctor image path
                    ),
                  ),
                ),
              )
            ]),
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    _pageController.jumpToPage(2); // Skip to the last page
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(color: Colors.white),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _currentPage < 2 ? 'Next' : 'Finish',
                    style: const TextStyle(color: Colors.black26),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        children: _buildPageContent(),
      ),
    );
  }
}
