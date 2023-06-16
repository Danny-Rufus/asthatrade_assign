import 'package:flutter/material.dart';

import 'first_screen.dart';
import 'web_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  _navigateToPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentPage == 0) {
          return true;
        } else {
          _navigateToPage(0);
          return false;
        }
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) => currentPage = value,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            FirstScreen(
              onPressed: () {
                _navigateToPage(1);
              },
            ),
            WebScreen(
              onBackPressed: () {
                _navigateToPage(0);
              },
            )
          ],
        ),
      ),
    );
  }
}
