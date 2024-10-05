import 'package:bdki/Home.dart';
import 'package:flutter/material.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set the background color to white
        elevation: 0, // Remove shadow
        automaticallyImplyLeading: false, // Remove back button
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
            // Image Container with description
            Center(
              // Wrap with Center widget
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/img_monas.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Monumen Nasional',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Description text
            const Text(
              'Explore Jakarta with Jakarta Tourist Pass',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Colors.orangeAccent,
              ),
            ),
            const SizedBox(height: 20),

            // Continue as a Guest buttons with gradient background
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
            // Help button at the bottom-right corner
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
        mainAxisAlignment: MainAxisAlignment.center, // Center the row contents
        children: [
          // First flag image
          Image.asset(
            flagImagePath1, // Path for the first flag image
            width: 40, // Set the width for the image
            height: 40, // Set the height for the image
            fit: BoxFit.cover, // Ensure the image covers the space
          ),
          // Second flag image
          Image.asset(
            flagImagePath2, // Path for the second flag image
            width: 40, // Set the width for the image
            height: 40, // Set the height for the image
            fit: BoxFit.cover, // Ensure the image covers the space
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
          // Navigate to GuestScreen when button is pressed
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
