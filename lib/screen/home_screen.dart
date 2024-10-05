import 'package:bdki/utils/widget/general_widget.dart';
import 'package:flutter/material.dart';
import 'event_jakarta.dart';
import 'jakarta_touris_pass.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                GeneralWidget.buildGradientBackground(),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GeneralWidget.buildAppBar(),
                      const SizedBox(height: 10),
                      GeneralWidget.buildUserInfo(),
                      const SizedBox(height: 30),
                      GeneralWidget.buildBalanceCard(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GeneralWidget.buildHorizontalMenu(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GeneralWidget.buildBanner(); // Replaced banner image
                  },
                ),
              ),
            ),
            GeneralWidget.buildPageIndicator(_pageController, 5), // Replaced page indicator
            const JakartaTouristPass(),
            const EventJakarta(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GeneralWidget.buildHelpButton(), // Replaced Help button
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GeneralWidget.buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: GeneralWidget.buildBottomNavigationBar(
        _bottomNavIndex,
            (index) => setState(() => _bottomNavIndex = index),
      ), // Replaced BottomNavigationBar
    );
  }
}
