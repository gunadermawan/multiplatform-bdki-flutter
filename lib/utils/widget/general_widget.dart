import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Home.dart';

class GeneralWidget {
  static Widget buildGradientBackground() {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orangeAccent, Colors.deepOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
    );
  }

  static Widget buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            'assets/images/img_jakone.png',
            height: 56,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.assignment_outlined, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  static Widget buildUserInfo() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, size: 38, color: Colors.orange),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning,",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Guest",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Balance Account",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Rp 0",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "-",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Top Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildHorizontalMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildMenuItem('assets/images/img_menu_maps.png', 'Explore'),
          _buildMenuItem('assets/images/img_menu_balance.png', 'Top Up'),
          _buildMenuItem('assets/images/img_menu_balance.png', 'JakCard'),
          _buildMenuItem('assets/images/img_menu_event.png', 'Event'),
        ],
      ),
    );
  }

  static Widget _buildMenuItem(String imageAsset, String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      // Padding around each card
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // 3D shadow effect
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover, // Ensures the image covers the entire card
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 14), // Customize text style if needed
          ),
        ],
      ),
    );
  }

  static Widget buildBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          'assets/images/img_banner.png',
          fit: BoxFit.fill,
          width: 350,
        ),
      ),
    );
  }

  static Widget buildPageIndicator(PageController controller, int count) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: const ExpandingDotsEffect(
        activeDotColor: Colors.orange,
        dotColor: Colors.grey,
        dotHeight: 8,
        dotWidth: 8,
        spacing: 8,
      ),
    );
  }

  static Widget buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.white,
      child: const Image(
        image: AssetImage('assets/images/img_qris.png'),
        width: 120,
        height: 120,
        fit: BoxFit.fill,
      ),
    );
  }

  static Widget buildBottomNavigationBar(
      int currentIndex, Function(int) onTap) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: 2,
      tabBuilder: (int index, bool isActive) {
        return Icon(
          index == 0 ? Icons.home : Icons.person,
          size: 24,
          color: isActive ? Colors.orange : Colors.grey,
        );
      },
      activeIndex: currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: onTap,
    );
  }

  static Widget buildHelpButton() {
    return GestureDetector(
      onTap: () {},
      child: const CircleAvatar(
        backgroundColor: Colors.orangeAccent,
        radius: 25,
        child: Icon(Icons.help, color: Colors.white),
      ),
    );
  }

  static Widget buildLanguageButton(
      String flagImagePath1, String flagImagePath2) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            flagImagePath1,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
          Image.asset(
            flagImagePath2,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  static Widget buildCardButton() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.credit_card, size: 24),
          SizedBox(width: 4),
          Image(
            image: AssetImage('assets/images/img_jakcard.png'),
            width: 60,
            height: 24,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }

  static Widget buildGradientButton(
      String text, bool isFirst, BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: isFirst
            ? const LinearGradient(
                colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        border:
            isFirst ? null : Border.all(color: Colors.orangeAccent, width: 2),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          text,
          style: TextStyle(
            color: isFirst ? Colors.white : Colors.orangeAccent,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
