import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Home.dart';
import 'guest_screen_state.dart';

class GuestScreen extends GetView<GuestScreenState> {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLanguageButton(
              'assets/images/img_id.png',
              'assets/images/img_en.png',
            ),
            _buildCardButton(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    Get.find<GuestScreenState>().currentIndex = index;
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/img_monas.png',
                          fit: BoxFit.fill,
                          width: 350, // Adjust width as needed
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            SmoothPageIndicator(
              controller: controller.pageController,
              count: 5,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.orange,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            const SizedBox(height: 20),
            // Description text
            const Text(
              'Explore Jakarta with Jakarta Tourist Pass',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.orangeAccent,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  _buildGradientButton('Continue as a Guest', true, context),
                  const SizedBox(height: 10),
                  _buildGradientButton('Continue as a Guest', false, context),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildHelpButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(String flagImagePath1, String flagImagePath2) {
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

  Widget _buildCardButton() {
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

  Widget _buildGradientButton(String text, bool isFirst, BuildContext context) {
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

  Widget _buildHelpButton() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: const Image(
        image: AssetImage(
          'assets/images/img_help.png',
        ),
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
