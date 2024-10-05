import 'package:bdki/utils/widget/general_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../state/guest_screen_state.dart';

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
            GeneralWidget.buildLanguageButton(
              'assets/images/img_id.png',
              'assets/images/img_en.png',
            ),
            GeneralWidget.buildCardButton(),
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
                          width: 350,
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
                  GeneralWidget.buildGradientButton(
                      'Continue as a Guest', true, context),
                  const SizedBox(height: 10),
                  GeneralWidget.buildGradientButton(
                      'Continue as a Guest', false, context),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GeneralWidget.buildHelpButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
