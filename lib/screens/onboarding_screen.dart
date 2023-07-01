import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:loyalty_app/screens/username_screen.dart';
import "dart:math" as math;
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 3 slides with title, subtitle and a lottie animation
    
    return Container(
     color: Color(0xFF0D1127),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: onboardingData.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    lottieLink: onboardingData[index].lottieLink,
                    title: onboardingData[index].title,
                    description: onboardingData[index].description,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.05,
                ),
                child: _pageIndex != onboardingData.length - 1
                    ? SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingData.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              width: _pageIndex == index ? 16 : 8,
                              decoration: BoxDecoration(
                                color: _pageIndex == index
                                    ? Color.fromARGB(255, 255, 215, 15)
                                    : Color.fromARGB(255, 255, 245, 168),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: 50,
                        width: 120,
                        decoration: const BoxDecoration(
                          
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(106, 153, 244, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              _createLoginRoute(),
                            );
                          },
                          child: const Text(
                            "Get Started!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route _createLoginRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const UsernameScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class Onboard {
  final String lottieLink, title, description;

  Onboard({
    required this.lottieLink,
    required this.title,
    required this.description,
  });
}

final List<Onboard> onboardingData = [
  Onboard(
    lottieLink: "assets/coins.json",
    title: "Earn points for every purchase!",
    description:
        "With Credeem you earn points for every purchase you make, use these points to get discounts on future purchases!",
  ),
  Onboard(
    lottieLink: "assets/store.json",
    title: "Explore new stores near you!",
    description:
        "Credeem helps you find the best stores around you, and get the best deals and offers on new products. ",
  ),
  Onboard(
    lottieLink: "assets/exchange2.json",
    title: "Swap creds between stores!",
    description:
        "Loyalty should always be rewarded, and Credeem does just that. Swap creds between stores and get the best deals!",
  )
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.lottieLink,
    required this.title,
    required this.description,
  });

  final String lottieLink, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Stack(
          children: [
            Image.asset(
              "assets/bg-gradient.png",
              fit: BoxFit.cover,
            ),
            Lottie.asset(lottieLink),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 16, color: Colors.white54),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ],
    );
  }
}
