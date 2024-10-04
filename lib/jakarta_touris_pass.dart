import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class JakartaTouristPass extends StatefulWidget {
  const JakartaTouristPass({super.key});

  @override
  _JakartaTouristPassState createState() => _JakartaTouristPassState();
}

class _JakartaTouristPassState extends State<JakartaTouristPass> {
  final PageController _pageController = PageController();
  int _currentIndex = 0; // Track the current index of the tourist cards

  final List<String> _touristPlaces = [
    'Ancol Entrance Gate',
    'Monumen Nasional',
    'Museum Fatahillah',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.orange, size: 30),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's Go with Jakarta Tourist Pass",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "a place not to be missed",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Add view all action here
                  },
                  child: const Text(
                    "View all",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Bagian "Did You Know?"
            Row(
              children: [
                Column(
                  children: [
                    const Text(
                      "Did You \nKnow ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      'assets/images/img_map.png',
                      width: 60,
                      height: 60,
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          itemCount: _touristPlaces.length,
                          itemBuilder: (context, index) {
                            return _buildTouristCard(
                              _touristPlaces[index],
                              'assets/images/img_monas.png',
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Add space between the PageView and the indicator
                      SmoothPageIndicator(
                        controller: _pageController, // PageController
                        count: _touristPlaces.length,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.orange,
                          dotColor: Colors.grey,
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTouristCard(String title, String imagePath) {
    return SizedBox(
      width: 150,
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () {
                      // Add detail button action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Detail",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
