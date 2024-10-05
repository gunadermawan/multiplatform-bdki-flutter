import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'Home.dart';

class GuestScreenState extends GetxController {
  final PageController _pageController = PageController();

  int currentPage = 0;
  int currentIndex = 0;

  PageController get pageController => _pageController;

  @override
  void onInit() {
    super.onInit();
    _pageController.addListener(() {
      currentPage = _pageController.page!.round();
      update();
    });
  }

  void navigateToHome() {
    Get.to(() => const Home());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
